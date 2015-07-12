# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :spablog do
  desc 'create default admin'
  task create_admin: :environment do
  admin = Admin.new(email: ENV['EMAIL'],
                    password: ENV['DB_PASSWORD'],
                    password_confirmation:  ENV['DB_PASSWORD'])
  #	admin.skip_confirmation!
  admin.save
  end
end
