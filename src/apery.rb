require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
    "Olá mundo! Bem vindos ao Floripa on Rails!"
end

get '/status' do
  "It's Alive!"
end