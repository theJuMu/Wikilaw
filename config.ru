
root_dir = File.dirname(__FILE__)
app_file = File.join(root_dir, 'app.rb')
require app_file

set :environment, ENV['RACK_ENV'].to_sym || :production
set :root, root_dir
set :app_file, app_file
set :public_folder, 'public'
disable :run


run Sinatra::Application
