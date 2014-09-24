require 'spec_helper'

describe 'SinatraRESTAssignemnt Events API' do

  it 'should make a new event' do
    post '/events', '{"data":"NAME is now at LATITUDE/LONGITUDE"}', {'Content-Type' => 'application/json'}
    expect(last_response.status).to be 200
    data = JSON.parse(last_response.body.to_s)
    data['status'].should == 'success'
  end

  it 'should get all events' do
    get '/events'
    expect(last_response.status).to be 200
    data = JSON.parse(last_response.body.to_s)
    data['status'].should == 'success'
  end

  it 'should delete all events' do
    delete '/events'
    expect(last_response.status).to be 200
    data = JSON.parse(last_response.body.to_s)
    data['status'].should == 'success'
  end

  it 'should get event with id' do
    post '/events', '{"data":"NAME is now at LATITUDE/LONGITUDE"}', {'Content-Type' => 'application/json'}
    event = Event.new(JSON.parse(last_response.body.to_s)['data'])

    get "/events/#{event.id}"
    expect(last_response.status).to be 200
    data = JSON.parse(last_response.body.to_s)
    data['status'].should == 'success'
  end

  it 'should update event with id' do
    post '/events', '{"data":"NAME is now at LATITUDE/LONGITUDE"}', {'Content-Type' => 'application/json'}
    event = Event.new(JSON.parse(last_response.body.to_s)['data'])
    old_event = event.dup

    event.data = "new data"
    put "/events/#{event.id}", event.to_json, {'Content-Type' => 'application/json'}
    expect(last_response.status).to be 200
    updated_event = Event.new(JSON.parse(last_response.body.to_s)['data'])
    updated_event.data.should_not == old_event.data
  end

  it 'should delete event with id' do
    post '/events', '{"data":"NAME is now at LATITUDE/LONGITUDE"}', {'Content-Type' => 'application/json'}
    event = Event.new(JSON.parse(last_response.body.to_s)['data'])

    delete "/events/#{event.id}"
    expect(last_response.status).to be 200
    data = JSON.parse(last_response.body.to_s)
    data['status'].should == 'success'
  end
end