source 'https://rubygems.org'

ruby '2.4.0'

gem 'rails', '~> 5.0.1'

# Ensure https when bundling from github
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'clearance', '~> 1.16'
gem 'coffee-rails', '~> 4.2'
gem 'flutie', '~> 2.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'bundler-audit', require: false
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end
