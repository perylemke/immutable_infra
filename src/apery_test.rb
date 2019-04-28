require File.expand_path '../apery_test_helper.rb', __FILE__

class MyTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_ola_mundo
    get '/'
    assert_equal "Olá mundo! Bem vindos ao Ruby Floripa!", last_response.body
  end

  def test_status
    get '/status'
    assert_equal "It's Alive!", last_response.body
  end
  
end