#
# Jekyll converter that renders GFM alerts.
#
# Inspired by GFM alerts:
#   https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts
#
# This plugin contains work from:
#   https://github.com/manabu-nakamura/jekyll-gfm-admonitions2/blob/b8adb47/lib/jekyll-gfm-admonitions.rb
#
# USAGE
#   > [!WARNING]
#   > Content goes here.
#
#   > [!INFO] PLUGIN USAGE
#   > Content goes here.
#
# OUTPUT
#   <aside role="note" class="admonition warning">
#     <div class="header">
#       <span class="icon" aria-hidden="true">[!]</span>
#       <span class="title">WARNING</span>
#     </div>
#     <div class="content">
#       <p>Content goes here.</p>
#     </div>
#     <div class="footer"></div>
#   </aside>
#
#   <aside role="note" class="admonition info">
#     <div class="header">
#       <span class="icon" aria-hidden="true">[!]</span>
#       <span class="title">PLUGIN USAGE</span>
#     </div>
#     <div class="content">
#       <p>Content goes here.</p>
#     </div>
#     <div class="footer"></div>
#   </aside>
#

module Jekyll
  class Admonition < Jekyll::Converter
    priority :low

    VERSION = '2.0.0'.freeze

    # Method required by Jekyll::Converter
    def matches(ext)
      ext =~ /^\.(md)$/i
    end

    # Method required by Jekyll::Converter
    def output_ext(_ext)
      '.html'
    end

    # See: _sass/components/admonitions
    TYPES = %w[caution danger important info note tip warning].freeze

    def convert(content)
      content.gsub!(/<blockquote>\s*<p>\s*\[!(#{TYPES.join('|')})\](.*?)\n(.*?)\s*<\/p>\s*<\/blockquote>/im) do
        type  = Regexp.last_match(1).downcase
        title = Regexp.last_match(2).strip.empty? ? type.upcase : Regexp.last_match(2).strip.upcase
        text  = Regexp.last_match(3)

        admonition_html(type, title, text)
      end

      return content
    end

    private

    def admonition_html(type, title, text)
      # rubocop:disable Layout/ArrayAlignment
      return %W[
        <aside role="note" class="admonition #{type}">
          <div class="header">
            <span class="icon" aria-hidden="true">[!]</span>
            <span class="title">#{title}</span>
          </div>
          <div class="content">
            #{text}
          </div>
          <div class="footer">
          </div>
        </aside>
      ].join(' ')
      # rubocop:enable Layout/ArrayAlignment
    end
  end
end

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::Admonition::VERSION} loaded."
