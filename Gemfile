# Lock Bundler version
# https://stackoverflow.com/a/51788614
if (version = Gem::Version.new(Bundler::VERSION)) < Gem::Version.new('2.4.5')
  abort "Bundler version >= 2.4.5 is required. You are running #{version}."
end

source 'https://rubygems.org'

gem 'html-proofer', '~> 5.0.4', require: false
gem 'jekyll', '~> 4.3.0'
gem 'mini_racer', '~> 0.6.3'
gem 'rubocop', '~> 1.44.0', require: false

# Plugins
group :jekyll_plugins do
  gem 'jekyll-autoprefixer'
  gem 'jekyll-paginate-v2'
end
