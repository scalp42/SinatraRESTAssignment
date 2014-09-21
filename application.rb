require 'sinatra/base'
require_relative 'routes/events'

class Application < Sinatra::Base
  register Sinatra::SinatraRestAssignment::Routing::Events
end