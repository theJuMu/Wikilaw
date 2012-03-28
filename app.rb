# dev hint: shotgun login.rb

require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

class Field
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :completed_at, DateTime
end

DataMapper.auto_upgrade!

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  if !session[:identity] then
    session[:previous_url] = request['REQUEST_PATH']
    @error = 'Sorry guacamole, you need to be logged in to do that'
    halt erb(:login_form)
  end
end

get '/' do
  erb 'Can you handle a <a href="/secure/place">secret</a>?'
end

get '/login/form' do 
  erb :login_form
end

post '/login/attempt' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from 
end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert-message'>Logged out</div>"
end


get '/secure/place' do
  erb "This is a secret place that only <%=session[:identity]%> has access to!"
end

post '/statuts' do
  @name = params[:name]
  puts @name
  @capital = params[:capital]
  puts @capital
  @adress = params[:adress]
  puts @adress
  @objet = params[:objet]
  puts @objet
  @move = params[:move]
  puts @move
  @banque = params[:banque]
  puts @banque
  @inalienabilite = params[:inalienabilite]
  puts @inalienabilite
  @lieu = params[:lieu]
  puts @lieu
  erb :statuts
end

get '/welcome' do 
  erb :welcome
end

$LOAD_PATH.unshift(Dir.getwd)
