#
# Liquid filter that wraps input inside HTML tags:
#   <kbd>
#   <mark>
#
# This plugin contains work from:
#   https://www.webisland.agency/blog/jekyll-remote-assets-linking-filter/
#
# USAGE
#   {{ "Alt" | kbd }} + {{ "F4" | kbd }}
#   {{ "String" | mark }}
#

module Jekyll
  module HTMLTags
    VERSION = '1.0.0'.freeze

    def mark(input)
      return "<mark>#{input}</mark>"
    end

    def kbd(input)
      return "<kbd>#{input}</kbd>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::HTMLTags)

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::HTMLTags::VERSION} loaded."
