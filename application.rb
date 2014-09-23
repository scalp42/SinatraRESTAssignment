require 'sinatra/base'
require 'sinatra/activerecord'
require './enviroments'
require_relative 'helpers/event_helpers'
require_relative 'routes/events'
require_relative 'models/event'

class Application < Sinatra::Base
  enable :logging

  helpers Sinatra::SinatraRestAssignment::Helpers::EventHelpers
  register Sinatra::SinatraRestAssignment::Routing::Events
end