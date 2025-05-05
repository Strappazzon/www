#
# Jekyll hooks that replace Markdown syntax elements with HTML tags:
#   <figure>
#   <ins>
#   <mark>
#   <kbd>
#
# Some inspired by PyMdown extension:
#   https://facelessuser.github.io/pymdown-extensions/extensions/caret/
#   https://facelessuser.github.io/pymdown-extensions/extensions/mark/
#   https://facelessuser.github.io/pymdown-extensions/extensions/keys/
#
# This plugin contains work from:
#   https://github.com/maximevaillancourt/digital-garden-jekyll-template/blob/5feb308/_plugins/markdown-highlighter.rb
#   https://github.com/stephenreid321/stephenreid/blob/9ab9f00/app/jekyll_blog/_plugins/custom_markdown_processor.rb
#   https://github.com/jonlpersson/ed-latimore/blob/3e29fef/site/_plugins/img-tag-transform.rb
#
# USAGE
#   ![Alt](https://example.com/#image.jpg "Caption")
#   ==important text==
#   ^^inserted text^^
#   ++CTRL++ + ++A++
#
# OUTPUT
#   <figure>
#     <img src="https://example.com/#image.jpg" alt="Alt">
#     <figcaption>Caption</figcaption>
#   </figure>
#
#   <mark>important text</mark>
#   <ins>inserted text</ins>
#   <kbd>CTRL</kbd> + <kbd>A</kbd>
#

module Jekyll
  module HTMLTags
    VERSION = '1.1.0'.freeze

    def self.figure(input)
      input.content.gsub!(/(?<!`)!\[(.*)\]\(([^\)]+)?"(.*)"\)(?!`)/i) do
        alt     = Regexp.last_match(1)
        url     = Regexp.last_match(2)
        caption = Regexp.last_match(3)

        # rubocop:disable Layout/ArrayAlignment
        %W[
          <figure>
            <img alt="#{alt}" src="#{url}">
            <figcaption>#{caption}</figcaption>
          </figure>
        ].join(' ')
        # rubocop:enable Layout/ArrayAlignment
      end
    end

    def self.ins(input)
      input.content.gsub!(/(?<!`)\^{2}([^ ](.*?)?[^ \^])\^{2}(?!`)/i) { |m| "<ins>#{m[2..-3]}</ins>" }
    end

    def self.mark(input)
      input.content.gsub!(/(?<!`)={2}([^ ](.*?)?[^ =])={2}(?!`)/im) { |m| "<mark>#{m[2..-3]}</mark>" }
    end

    def self.kbd(input)
      input.content.gsub!(/(?<!`)\+{2}([^ ](.*?)?[^ \+])\+{2}(?!`)/i) { |m| "<kbd>#{m[2..-3]}</kbd>" }
    end
  end
end

# Hook: Blog collection
Jekyll::Hooks.register [:blog], :pre_render do |h|
  Jekyll::HTMLTags.figure(h)
  Jekyll::HTMLTags.ins(h)
  Jekyll::HTMLTags.mark(h)
  Jekyll::HTMLTags.kbd(h)
end

# Hook: Website pages
Jekyll::Hooks.register [:pages], :pre_render do |h|
  # Match only Markdown files inside 'pages/'
  next unless h.path.match?(/^pages\/([\w\d\-]+(\/)?)+\.md$/i)

  Jekyll::HTMLTags.figure(h)
  Jekyll::HTMLTags.ins(h)
  Jekyll::HTMLTags.mark(h)
  Jekyll::HTMLTags.kbd(h)
end

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::HTMLTags::VERSION} loaded."
