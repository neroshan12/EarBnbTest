ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'carrierwave/datamapper'

CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/properties'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
