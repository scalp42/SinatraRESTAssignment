require 'sinatra/base'

module Sinatra
  module SinatraRestAssignment
    module Routing
      module Events
        #Events module to keep event routes separate from other routes that could be added
        def self.registered(app)

          app.get '/events' do
            "everything works and including bundler and puma"
            #TODO: List all events
          end

          app.post '/events' do
            #TODO: Make a new event
          end

          app.delete '/events' do
            #TODO: Delete all events
          end

          app.get '/events/:id' do |id|
            #TODO: Show event with id
          end

          app.put '/events/:id' do |id|
            #TODO: Update event with id
          end

          app.delete '/events/:id' do |id|
            #TODO: Delete event with id
          end

        end
      end
    end
  end
end