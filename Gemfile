# Lock Bundler version
# https://stackoverflow.com/a/51788614
if (version = Gem::Version.new(Bundler::VERSION)) < Gem::Version.new('4.0.13')
  abort "Bundler version >= 4.0.13 is required. You are running #{version}."
end

source 'https://rubygems.org'

gem 'jekyll', '~> 4.4.0'
gem 'mini_racer', '~> 0.21.0'

gem 'html-proofer', '~> 5.2.0', require: false
gem 'rubocop', '~> 1.88.0', require: false

# Plugins
group :jekyll_plugins do
  gem 'jekyll-autoprefixer-v2', '~> 2.0.0'
  gem 'jekyll-paginate-v2', '~> 3.0.0'
  gem 'jekyll-terser', '~> 1.0.0'
  gem 'jekyll-toc', '~> 0.19.0'
end
