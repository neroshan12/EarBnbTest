require 'data_mapper'
require 'dm-timestamps'
require 'dm-postgres-adapter'

require_relative 'models/property'
require_relative 'models/user'
require_relative 'models/comment'

DataMapper.setup(:default,  ENV['DATABASE_URL'] || "postgres://localhost/earbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
