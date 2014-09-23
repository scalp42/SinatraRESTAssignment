require 'sinatra/base'
require 'sinatra/activerecord'
require './enviroments'
require_relative 'routes/events'
require_relative 'models/event'

class Application < Sinatra::Base
  enable :logging
  register Sinatra::SinatraRestAssignment::Routing::Events
end