# Lock Bundler version
# https://stackoverflow.com/a/51788614
if (version = Gem::Version.new(Bundler::VERSION)) < Gem::Version.new('2.4.5')
  abort "Bundler version >= 2.4.5 is required. You are running #{version}."
end

source 'https://rubygems.org'

gem 'html-proofer', '~> 5.0', require: false
gem 'jekyll', '~> 4.3'
gem 'mini_racer', '~> 0.6'
gem 'rubocop', '~> 1.57.0', require: false

# Plugins
group :jekyll_plugins do
  gem 'jekyll-autoprefixer', '~> 1.0'
  gem 'jekyll-paginate-v2', '~> 3.0'
end
