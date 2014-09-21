require 'spec_helper'

describe 'SinatraRESTAssignemnt Events API' do

  it 'should make a new event' do
    post '/events'
    expect(last_response.status).to be 200
  end

  it 'should get all events' do
    get '/events'
    expect(last_response.status).to be 200
  end

  it 'should delete all events' do
    delete '/events'
    expect(last_response.status).to be 200
  end

  it 'should get event with id' do
      get '/events/1'
      expect(last_response.status).to be 200
    end

    it 'should update event with id' do
      put '/events/1'
      expect(last_response.status).to be 200
    end

    it 'should delete event with id' do
      delete '/events/1'
      expect(last_response.status).to be 200
    end
end