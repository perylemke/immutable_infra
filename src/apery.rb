require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
    "Olá mundo! Bem vindos ao Ruby Floripa!"
end

get '/status' do
  "It's Alive!"
end