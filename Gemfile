source 'https://rubygems.org'

ruby '2.4.0'

gem 'rails', '~> 5.0.1'

# Ensure https when bundling from github
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aws-sdk', '~> 2.1'
gem 'bower-rails', '~> 0.11.0'
gem 'bundler-audit', require: false
gem 'clearance', '~> 1.16'
gem 'fastimage', '~> 1.8'
gem 'flutie', '~> 2.0'
gem 'jquery-fileupload-rails'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pundit', '~> 1.1.0'
gem 'roda', '~> 2.22'
gem 'sass-rails', '~> 5.0'
gem 'shrine', '~> 2.5'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webdack-uuid_migration'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker', '~> 1.7.2'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'guard'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
  gem 'rack-livereload'
  gem 'rubocop', '~> 0.47.1', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'shrine-memory'
end
