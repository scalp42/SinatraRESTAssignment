require 'sinatra/base'
require 'json'

module Sinatra
  module SinatraRestAssignment
    module Routing
      module Events
        #Events module to keep event routes separate from other routes that could be added
        def self.registered(app)

          app.after do
            ActiveRecord::Base.connection.close
          end

          app.get '/events' do
            events = Event.all
            content_type :json
            [200, get_return_payload('success', events)]
          end

          app.post '/events' do
            event = Event.new(JSON.parse request.body.read.to_s)
            event.save

            content_type :json
            if (event.save)
              [200, get_return_payload('success', event)]
            else
              [400, get_return_payload('failure', nil, event.errors)]
            end
          end

          app.delete '/events' do
            if (Event.destroy_all)
              [200, get_return_payload('success', nil)]
            else
              [500, get_return_payload('failure', nil, ["Internal server error"])]
            end
          end

          app.get '/events/:id' do |id|
            content_type :json
            begin
              event = Event.find(id)
              [200, get_return_payload('success', event)]
            rescue ActiveRecord::RecordNotFound
              record_not_found(id)
            end
          end

          app.put '/events/:id' do |id|
            content_type :json
            begin
              event = Event.find(id)

              if (event.update(JSON.parse request.body.read.to_s))
                [200, get_return_payload('success', event)]
              else
                [400, get_return_payload('failure', nil, event.errors)]
              end
            rescue ActiveRecord::RecordNotFound
              record_not_found(id)
            end
          end

          app.delete '/events/:id' do |id|
            content_type :json
            begin
              event = Event.find(id)

              if (event.destroy)
                [200, get_return_payload('success', nil)]
              else
                [400, get_return_payload('failure', nil, event.errors)]
              end
            rescue ActiveRecord::RecordNotFound
              record_not_found(id)
            end
          end

        end
      end
    end
  end
end