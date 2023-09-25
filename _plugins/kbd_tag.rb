#
# Liquid filter that wraps input inside kbd HTML tag
#
# This plugin contains work from:
#   https://www.webisland.agency/blog/jekyll-remote-assets-linking-filter/
#
# USAGE
#   {{ "String" | kbd }}
#

module Jekyll
  module KbdHTMLTag
    VERSION = '1.0.0'.freeze

    def kbd(input)
      return "<kbd>#{input}</kbd>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::KbdHTMLTag)

Jekyll.logger.info "Plugin:","#{File.basename(__FILE__)} #{Jekyll::KbdHTMLTag::VERSION} loaded."
