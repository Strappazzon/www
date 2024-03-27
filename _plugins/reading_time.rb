#
# Liquid filter that outputs reading time
#
# This plugin contains work from:
#   https://gist.github.com/zachleat/5792681
#   https://gist.github.com/tohuw/cbcc8653321b9a3fb230
#   https://github.com/risan/jekyll-reading-time/blob/master/reading_time_filter.rb
#
# USAGE
#   {{ page.content | reading_time }}
#   {{ page.content | reading_time_in_s }}
#
# CONFIG
#   reading_time:
#     words_per_minute: 180
#

require 'nokogiri'

module Jekyll
  module ReadingTimeFilter
    VERSION = '2.0.0'.freeze
    # Words per minute
    WPM     = 180

    def initialize(context)
      @context = context
      @config  = @context.registers[:site].config['reading_time'] || {}
    end

    # Outputs reading time in minutes
    def reading_time(input)
      words_per_minute = (@config['words_per_minute'].to_i unless @config['words_per_minute'].nil? || @config['words_per_minute'].zero?) || WPM
      words            = Nokogiri::HTML5.fragment(strip_pre_tags(input)).text.split.size
      rtime            = (words / words_per_minute).floor

      return rtime
    end

    # Outputs reading time in seconds
    def reading_time_in_s(input)
      words_per_minute = (@config['words_per_minute'].to_i unless @config['words_per_minute'].nil? || @config['words_per_minute'].zero?) || WPM
      words            = Nokogiri::HTML5.fragment(strip_pre_tags(input)).text.split.size
      rtime            = (words / words_per_minute).floor

      return (rtime * 60)
    end

    private

    def strip_pre_tags(input)
      return input.to_s.gsub(/<pre(?:(?!<\/pre).|\s)*<\/pre>/im, '')
    end
  end
end

Liquid::Template.register_filter(Jekyll::ReadingTimeFilter)

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::ReadingTimeFilter::VERSION} loaded."
