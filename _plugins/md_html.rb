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
#   https://github.com/hoonti06/jekyll-code-block-linenos/blob/dda2d37/lib/jekyll-code-block-linenos.rb
#
# USAGE
#   ```ini "file name.ini"
#   [example]
#   key="value"
#   ````
#   ![Alt](https://example.com/#image.jpg "Caption")
#   ==important text==
#   ^^inserted text^^
#   ++CTRL++ + ++A++
#
# OUTPUT
#   <div class="machine__code-header"><span class="title">file name.ini</span></div>
#   {% highlight ini %}
#   [example]
#   key="value"
#   {% endhighlight %}
#
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
    VERSION = '1.2.1'.freeze

    def self.codeblock(input)
      input.content.gsub!(/[[:blank:]]*```(.*)[[:blank:]]"(.*)?"([\w\W]*?)[[:blank:]]*```[[:blank:]]*(\n|$)/i) do
        lang  = Regexp.last_match(1).downcase
        title = Regexp.last_match(2).strip.empty? ? 'Source Code'.upcase : Regexp.last_match(2).to_s
        code  = Regexp.last_match(3)

        # If ever considering changing the button text with JS
        # announce it to screen readers, below <button>
        # <span role="alert" class="visually-hidden"></span>

        # rubocop:disable Layout/ArrayAlignment
        %W[
          <div class="machine__code">
            <div class="machine__code-header">
              <span class="title">#{title}</span>
              <button class="clipboard">COPY</button>
            </div>
            {% highlight #{lang} %}\n#{code}{% endhighlight %}#{Regexp.last_match(4)}
          </div>
        ].join("\n")
        # rubocop:enable Layout/ArrayAlignment
      end
    end

    def self.figure(input)
      input.content.gsub!(/(?<!`)!\[(.*)\]\(([^\)]+)?"(.*)"\)(?!`)/i) do
        alt     = Regexp.last_match(1)
        url     = Regexp.last_match(2).strip
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
  Jekyll::HTMLTags.codeblock(h)
  Jekyll::HTMLTags.figure(h)
  Jekyll::HTMLTags.ins(h)
  Jekyll::HTMLTags.mark(h)
  Jekyll::HTMLTags.kbd(h)
end

# Hook: Website pages
Jekyll::Hooks.register [:pages], :pre_render do |h|
  # Match only Markdown files inside 'pages/'
  next unless h.path.match?(/^pages\/([\w\d\-]+(\/)?)+\.md$/i)

  Jekyll::HTMLTags.codeblock(h)
  Jekyll::HTMLTags.figure(h)
  Jekyll::HTMLTags.ins(h)
  Jekyll::HTMLTags.mark(h)
  Jekyll::HTMLTags.kbd(h)
end

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::HTMLTags::VERSION} loaded."
