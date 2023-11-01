#
# Kramdown converter that inserts anchors to Markdown headings
#
# This plugin contains work from:
#   https://github.com/tinymce/tinymce-docs/blob/557623ea07ddfd6fdbdeae4942ae5900c55795ad/_plugins/headers_anchors.rb
#
# CONFIG
#   anchors:
#     prefix: section
#
# TODO
#   Split heading ID if it's too long
#

require 'kramdown'
require 'nokogiri'

module Jekyll
  module Anchors
    VERSION = '1.0.0'.freeze

    # Get plugin config
    # https://stackoverflow.com/a/45693637
    class PluginConfig < Jekyll::Generator
      def generate(site)
        config = site.config['anchors'] || ''
        Kramdown::Converter::Html.config = config
      end
    end

    # rubocop:disable Style/ClassAndModuleChildren
    class Kramdown::Converter::Html
      # Make plugin configuration available
      class << self
        attr_accessor :config
      end

      def convert_header(el, _indent)
        config  = Kramdown::Converter::Html.config
        content = el.options[:raw_text]
        level   = el.options[:level]
        prefix  = "#{config['prefix']}-" unless !config['prefix'] || config['prefix'].empty?
        anchor  = Nokogiri::HTML(content).text.gsub(/[^\w\d]/i, '-').downcase

        # Styles inside base/_base.scss
        return %W[
          <div class="container__heading anchorable">
          <h#{level} id="#{prefix}#{anchor}">#{content}</h#{level}>
          <a href="##{prefix}#{anchor}" class="anchor">
          <span aria-hidden="true">#</span>
          <span class="visually-hidden">Section titled #{content}</span>
          </a>
          </div>
        ].join(' ')
      end
    end
    # rubocop:enable Style/ClassAndModuleChildren
  end
end

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::Anchors::VERSION} loaded."
