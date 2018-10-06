require 'rails_helper'

describe 'registration routes' do
  it 'should route to registrations#create' do
    expect(post '/sign_up').to route_to('registrations#create')
  end
end
