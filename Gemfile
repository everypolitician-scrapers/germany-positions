# frozen_string_literal: true

# It's easy to add more libraries or choose different versions. Any libraries
# specified here will be installed and made available to your morph.io scraper.
# Find out more: https://morph.io/documentation/ruby

ruby '2.4.4'

source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

gem 'rest-client'
gem 'scraped', github: 'everypolitician/scraped', branch: 'scraper-class'
gem 'scraperwiki', github: 'openaustralia/scraperwiki-ruby', branch: 'morph_defaults'
gem 'sqlite_magic', github: 'openc/sqlite_magic'

group :quality do
  gem 'rubocop'
end

group :development do
  gem 'pry'
end
