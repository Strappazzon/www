# Liquid filter that outputs reading time
#
# USAGE
#   {{ page.content | reading_time }}
#   {{ page.content | reading_time_in_s }}
#
# This plugin contains work from:
#   https://gist.github.com/zachleat/5792681
#   https://github.com/risan/jekyll-reading-time/blob/master/reading_time_filter.rb

module Jekyll
  module ReadingTimeFilter
    VERSION = '1.0.0'.freeze

    # Outputs reading time in minutes
    def reading_time(input)
      # Load configuration
      config = @context.registers[:site].config['reading_time']

      # Set default values
      if !config
        # Whether to return an integer or float
        # Default: Int
        return_float = false
        # Words per minute
        # Default: 180
        words_per_minute = 180
      else
        return_float     = config['precise_result'] || false
        words_per_minute = config['words_per_minute'] || 180
      end

      words = input.split.size
      time = return_float ? (words.to_f / words_per_minute) : (words / words_per_minute)

      return time.round(1)
    end

    def reading_time_in_s(input)
      # Load configuration
      config = @context.registers[:site].config['reading_time']

      # Set default values
      # rubocop:disable Style/ConditionalAssignment
      if !config
        # Words per minute
        # Default: 180
        words_per_minute = 180
      else
        words_per_minute = config['words_per_minute'] || 180
      end
      # rubocop:enable Style/ConditionalAssignment

      words = input.split.size
      time = (words.to_f / words_per_minute)

      return (time * 60).round
    end
  end
end

Liquid::Template.register_filter(Jekyll::ReadingTimeFilter)

STDOUT.puts("            Plugin: #{File.basename(__FILE__)} #{Jekyll::ReadingTimeFilter::VERSION} loaded")
