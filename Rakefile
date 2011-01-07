# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

ITJobs::Application.load_tasks

task :run => [:set_development_environment] do
  sh "rails server"
  # sh "shotgun config.ru -s thin -E development" 
  # sh "thin start -R config.ru " #-a local.cre8ivethought.com"
  # sh "rackup -o local.cre8ivethought.com -p 3000"
end

task :test => [:set_test_environment] do
  sh "bundle exec watchr"
end

task :set_heroku_production_environment do
  sh "heroku config:add RACK_ENV=production"
#  sh "heroku config:add LINKEDIN_KEY=Z0rURAzH7R5yGn5GBXT0iY4Jx5AfKzRwxKeUW0wP8CXKaEOToy1qja0Oo-7-ybZ2"
#  sh "heroku config:add LINKEDIN_SECRET=jgOtTY25cIB93AuNnN7UiXgjbHZEw4b7wa2boYcWEWRkza1lFWq0g-mUlfjdtb2j"

#  sh "heroku config:add FACEBOOK_KEY=6b92639d5e752a036e54f4b5ef6ff39c"
#  sh "heroku config:add FACEBOOK_SECRET=307a61a51ee9b3153e7a7e4ee419d80e"

#  sh "heroku config:add TWITTER_KEY=6b92639d5e752a036e54f4b5ef6ff39c"
#  sh "heroku config:add TWITTER_SECRET=307a61a51ee9b3153e7a7e4ee419d80e"
  
  sh "heroku config:add MONGODB_PORT=27036"
  sh "heroku config:add MONGODB_HOST=flame.mongohq.com"
  sh "heroku config:add MONGODB_DATABASE=itjobs-production"
  sh "heroku config:add MONGODB_USER_NAME=itjo.bs"
  sh "heroku config:add MONGODB_PASSWORD=itjo.bs"
  sh "heroku config:add BUNDLE_WITHOUT='test development'"
  
  sh "heroku config"
end

task :set_heroku_development_environment do
  sh "heroku config:add RACK_ENV=production"
#  sh "heroku config:add LINKEDIN_KEY=Z0rURAzH7R5yGn5GBXT0iY4Jx5AfKzRwxKeUW0wP8CXKaEOToy1qja0Oo-7-ybZ2"
#  sh "heroku config:add LINKEDIN_SECRET=jgOtTY25cIB93AuNnN7UiXgjbHZEw4b7wa2boYcWEWRkza1lFWq0g-mUlfjdtb2j"

#  sh "heroku config:add FACEBOOK_KEY=49340d3e81ed205212e33f27ab843e4d"
#  sh "heroku config:add FACEBOOK_SECRET=01b3b3a8818eac261427236ae4c67c33"

#  sh "heroku config:add TWITTER_KEY=6b92639d5e752a036e54f4b5ef6ff39c"
#  sh "heroku config:add TWITTER_SECRET=307a61a51ee9b3153e7a7e4ee419d80e"
  
  sh "heroku config:add MONGODB_PORT=27038"
  sh "heroku config:add MONGODB_HOST=flame.mongohq.com"
  sh "heroku config:add MONGODB_DATABASE=itjobs-development"
  sh "heroku config:add MONGODB_USER_NAME=itjo.bs"
  sh "heroku config:add MONGODB_PASSWORD=itjo.bs"
  sh "heroku config:add BUNDLE_WITHOUT='test development'"
  
  sh "heroku config"
end

task :set_development_environment do
#  ENV['LINKEDIN_KEY'] = "Z0rURAzH7R5yGn5GBXT0iY4Jx5AfKzRwxKeUW0wP8CXKaEOToy1qja0Oo-7-ybZ2"
#  ENV['LINKEDIN_SECRET'] = "jgOtTY25cIB93AuNnN7UiXgjbHZEw4b7wa2boYcWEWRkza1lFWq0g-mUlfjdtb2j"

#  ENV['FACEBOOK_KEY'] = "b2753775388764c459276d14871ea195"
#  ENV['FACEBOOK_SECRET'] = "25dc68a8c72a0762f51595bf56a3dede"

#  ENV['TWITTER_KEY'] = "6b92639d5e752a036e54f4b5ef6ff39c"
#  ENV['TWITTER_SECRET'] = "307a61a51ee9b3153e7a7e4ee419d80e"
  
end

task :set_test_environment do
#  ENV['LINKEDIN_KEY'] = "Z0rURAzH7R5yGn5GBXT0iY4Jx5AfKzRwxKeUW0wP8CXKaEOToy1qja0Oo-7-ybZ2"
#  ENV['LINKEDIN_SECRET'] = "jgOtTY25cIB93AuNnN7UiXgjbHZEw4b7wa2boYcWEWRkza1lFWq0g-mUlfjdtb2j"

#  ENV['FACEBOOK_KEY'] = "b2753775388764c459276d14871ea195"
#  ENV['FACEBOOK_SECRET'] = "25dc68a8c72a0762f51595bf56a3dede"

#  ENV['TWITTER_KEY'] = "6b92639d5e752a036e54f4b5ef6ff39c"
#  ENV['TWITTER_SECRET'] = "307a61a51ee9b3153e7a7e4ee419d80e"
  
end
