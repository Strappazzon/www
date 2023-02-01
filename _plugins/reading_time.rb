#
# Liquid filter that outputs reading time
#
# This plugin contains work from:
#   https://gist.github.com/zachleat/5792681
#   https://github.com/risan/jekyll-reading-time/blob/master/reading_time_filter.rb
#
# USAGE
#   {{ page.content | reading_time }}
#   {{ page.content | reading_time_in_s }}
#
# CONFIG
#   reading_time:
#     return_float: false
#     words_per_minute: 180
#

module Jekyll
  module ReadingTimeFilter
    VERSION = '1.0.0'.freeze
    # Words per minute
    WPM     = 180

    # Outputs reading time in minutes
    def reading_time(input)
      # Load configuration
      config = @context.registers[:site].config['reading_time']

      if config
        # Whether to return an integer or float
        # Default: Int
        return_float     = config['precise_result'] || false
        words_per_minute = config['words_per_minute'] || WPM
      else
        return_float = false
        words_per_minute = WPM
      end

      words = input.split.size
      time = return_float ? (words.to_f / words_per_minute) : (words / words_per_minute)

      return time.round(1)
    end

    # Outputs reading time in seconds
    def reading_time_in_s(input)
      # Load configuration
      config = @context.registers[:site].config['reading_time']

      words_per_minute = config ? config['words_per_minute'] || WPM : WPM

      words = input.split.size
      time = (words.to_f / words_per_minute)

      return (time * 60).round
    end
  end
end

Liquid::Template.register_filter(Jekyll::ReadingTimeFilter)

$stdout.puts("            Plugin: #{File.basename(__FILE__)} #{Jekyll::ReadingTimeFilter::VERSION} loaded")
