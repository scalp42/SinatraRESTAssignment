require 'rack/test'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../application.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Application end
end

RSpec.configure { |c| c.include RSpecMixin }