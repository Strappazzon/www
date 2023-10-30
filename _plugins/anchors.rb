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

# rubocop:disable Style/ClassAndModuleChildren

module Jekyll
  module Anchors
    VERSION = '1.0.0'.freeze

    # Get plugin config
    # https://stackoverflow.com/a/45693637
    class PluginConfig < Jekyll::Generator
      def generate(site)
        config = site.config['anchors'] unless site.config['anchors'].nil?
        Kramdown::Converter::Html.config = config
      end
    end

    class Kramdown::Converter::Html
      # rubocop:disable Style/ClassVars
      @@config = nil

      def self.config=(config)
        @@config = config
      end
      # rubocop:enable Style/ClassVars

      def self.config
        @@config
      end

      def convert_header(el, _indent)
        level   = el.options[:level]
        content = el.options[:raw_text]
        prefix  = "#{@@config['prefix']}-" unless !@@config || !@@config['prefix'] || @@config['prefix'].empty?
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
  end
end

# rubocop:enable Style/ClassAndModuleChildren

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::Anchors::VERSION} loaded."
