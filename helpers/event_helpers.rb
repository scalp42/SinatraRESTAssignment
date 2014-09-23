module Sinatra
  module SinatraRestAssignment
    module Helpers
      module EventHelpers

        def record_not_found(id)
          [400, get_return_payload('failure', nil, ["Could not find Event with ID: #{id}"])]
        end

        def get_return_payload (status, data = nil, errors = nil)
          {
              status: status,
              errors: errors,
              data: data
          }.to_json
        end

      end
    end
  end
end