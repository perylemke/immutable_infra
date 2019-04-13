ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require File.expand_path '../apery.rb', __FILE__