# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :spablog do
  desc "create default admin"
  task :create_admin => :environment do
	admin = Admin.new({
	  email: 'leej@librely.com',
	  password: 'lanfear1',
	  password_confirmation: 'lanfear1'
	})
#	admin.skip_confirmation!
	admin.save
  end
end
