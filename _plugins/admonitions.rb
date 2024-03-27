#
# Liquid block that outputs admonitions.
# Nested admonitions in Markdown are not supported.
#
# USAGE
#   {% admonition type="info" title="Plugin usage" %}
#     Content goes here.
#   {% endadmonition %}
#
# OUTPUT
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

require 'kramdown'

module Jekyll
  class Admonition < Liquid::Block
    VERSION = '1.0.0'.freeze

    # See: _sass/components/admonitions
    TYPES = %w[danger info warning].freeze

    def initialize(tag_name, arguments, _tokens)
      super

      @args = parse_args(arguments)

      # Use the admonition type as title if none is provided
      @title = @args['title'].nil? || @args['title'].empty? ? @args['type'].upcase : @args['title'].upcase.gsub(/(\.)+$/, '')
      @type  = @args['type']
    end

    def render(context)
      content = Kramdown::Document.new(super).to_html

      return %W[
        <aside role="note" class="admonition #{@type}">
        <div class="header">
        <span class="icon" aria-hidden="true">[!]</span>
        <span class="title">#{@title}</span>
        </div>
        <div class="content">
        #{content.strip}
        </div>
        <div class="footer">
        </div>
        </aside>
      ].join(' ')
    end

    private

    def parse_args(arguments)
      args = {}

      # key="value"
      arguments.scan(/(\w+)\s*=\s*"([^"]*)"/i) { |k, v| args[k] = v }

      raise ArgumentError, "Invalid number of arguments for {% admonition %} block. Expected 1 or 2, got #{args.length}." unless [1, 2].include? args.length
      raise ArgumentError, 'Invalid argument "type" for {% admonition %} block. Value is required.' if args['type'].nil? || args['type'].empty?
      raise ArgumentError, "Invalid argument \"type\" for {% admonition %} block. Supported types are #{TYPES.join(', ')}" unless TYPES.include? args['type']

      return args
    end
  end
end

Liquid::Template.register_tag('admonition', Jekyll::Admonition)

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::Admonition::VERSION} loaded."
