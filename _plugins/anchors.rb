#
# Kramdown converter that inserts anchors to Markdown headings
#
# This plugin contains work from:
#   https://github.com/tinymce/tinymce-docs/blob/557623e/_plugins/headers_anchors.rb
#
# CONFIG
#   anchors:
#     prefix: section
#
# TODO: Truncate header ID if it's too long
#

require 'kramdown'
require 'nokogiri'

module Jekyll
  module Anchors
    VERSION = '1.0.2'.freeze

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

      def convert_header(el, indent)
        config        = Kramdown::Converter::Html.config
        content       = inner(el, indent)
        content_raw   = el.options[:raw_text]
        level         = el.options[:level]
        anchor_prefix = build_anchor_prefix(config)
        anchor_text   = build_anchor_text(content_raw)

        build_header_html(level, anchor_prefix, anchor_text, content, content_raw)
      end

      private

      def build_anchor_prefix(config)
        return "#{config['prefix']}-" unless !config['prefix'] || config['prefix'].empty?
      end

      def build_anchor_text(content_raw)
        return Nokogiri::HTML(content_raw).text.gsub(/[^\w\d]/i, '-').downcase
      end

      def build_header_html(level, anchor_prefix, anchor_text, content, content_raw)
        # See: _sass/base/_base.scss
        # rubocop:disable Layout/ArrayAlignment
        %W[
          <div class="container__heading anchorable">
            <h#{level} id="#{anchor_prefix}#{anchor_text}">#{content}</h#{level}>
            <a href="##{anchor_prefix}#{anchor_text}" class="anchor">
              <span aria-hidden="true">#</span>
              <span class="visually-hidden">Section titled #{content_raw}</span>
            </a>
          </div>
        ].join(' ')
        # rubocop:enable Layout/ArrayAlignment
      end
    end
    # rubocop:enable Style/ClassAndModuleChildren
  end
end

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::Anchors::VERSION} loaded."
