#
# Jekyll plugin that wraps Markdown input inside HTML tags:
#   <ins>
#   <mark>
#   <kbd>
#
# Inspired by PyMdown extension:
#   https://facelessuser.github.io/pymdown-extensions/extensions/caret/
#   https://facelessuser.github.io/pymdown-extensions/extensions/mark/
#   https://facelessuser.github.io/pymdown-extensions/extensions/keys/
#
# This plugin contains work from:
#   https://github.com/maximevaillancourt/digital-garden-jekyll-template/blob/main/_plugins/markdown-highlighter.rb
#   https://github.com/stephenreid321/stephenreid/blob/master/app/jekyll_blog/_plugins/custom_markdown_processor.rb
#
# USAGE
#   ==important text==
#   ^^inserted text^^
#   ++CTRL++ + ++A++
#
# OUTPUT
#   <mark>important text</mark>
#   <ins>inserted text</ins>
#   <kbd>CTRL</kbd> + <kbd>A</kbd>
#

module Jekyll
  module HTMLTags
    VERSION = '1.0.0'.freeze

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
Jekyll::Hooks.register [:blog], :pre_render do |i|
  Jekyll::HTMLTags.ins(i)
  Jekyll::HTMLTags.mark(i)
  Jekyll::HTMLTags.kbd(i)
end

# Hook: All website pages
Jekyll::Hooks.register [:pages], :pre_render do |i|
  # Match only Markdown documents inside 'pages/'
  next unless i.path.match?(/^pages\/([\w\d\-]+(\/)?)+\.md$/i)

  Jekyll::HTMLTags.ins(i)
  Jekyll::HTMLTags.mark(i)
  Jekyll::HTMLTags.kbd(i)
end

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::HTMLTags::VERSION} loaded."
