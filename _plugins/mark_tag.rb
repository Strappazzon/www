#
# Liquid filter that wraps input inside mark HTML tag
#
# This plugin contains work from:
#   https://www.webisland.agency/blog/jekyll-remote-assets-linking-filter/
#
# USAGE
#   {{ "String" | mark }}
#

module Jekyll
  module MarkHTMLTag
    VERSION = '1.0.0'.freeze

    def mark(input)
      return "<mark>#{input}</mark>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::MarkHTMLTag)

Jekyll.logger.info "Plugin:","#{File.basename(__FILE__)} #{Jekyll::MarkHTMLTag::VERSION} loaded."
