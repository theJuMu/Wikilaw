require './app'
run Sinatra::Application

$LOAD_PATH.unshift(Dir.getwd)