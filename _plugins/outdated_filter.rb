#
# Liquid filter that returns when a post was last updated
#
# This plugin contains work from:
#   https://github.com/kzykbys/JekyllPlugins/blob/f211936/deprecating_keeper.rb
#
# USAGE
#   {{ page.last_modified_at | old_after_m: N }}
#   {{ page.last_modified_at | default: page.date | old_after_m: N }}
#

require 'time'

module Jekyll
  module OutdatedFilter
    VERSION = '1.0.0'.freeze

    def old_after_m(date, months)
      return if date.nil?

      curr_months = ((Time.now.year * 12) + Time.now.mon)
      post_months = ((date.year * 12) + date.mon)
      diff_months = (curr_months - post_months)

      return unless diff_months >= months

      return diff_months
    end
  end
end

Liquid::Template.register_filter(Jekyll::OutdatedFilter)

Jekyll.logger.info 'Plugin:', "#{File.basename(__FILE__)} #{Jekyll::OutdatedFilter::VERSION} loaded."
