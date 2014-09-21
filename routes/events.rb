require 'sinatra/base'

module Sinatra
  module SinatraRestAssignment
    module Routing
      module Events
        #Events module to keep event routes separate from other routes that could be added
        def self.registered(app)

          app.get '/events' do
            "everything works and including bundler and puma"
          end

        end
      end
    end
  end
end