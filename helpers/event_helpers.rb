module Sinatra
  module SinatraRestAssignment
    module Helpers
      module EventHelpers

        def record_not_found(id)
          [400, "{\"error\": \"Could not find Event with ID: #{id}\"}"]
        end

      end
    end
  end
end