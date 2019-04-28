require 'sinatra/base'

class Apery <  Sinatra::Base
  get '/' do
    "Olá mundo! Bem vindos ao Floripa on Rails!"
  end

  get '/status' do
    "It's Alive!"
  end
end