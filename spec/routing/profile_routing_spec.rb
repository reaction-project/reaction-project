require 'rails_helper'

RSpec.describe 'routing to profile', type: :routing do
  it 'routes GET /profile to profile#show' do
    expect(get: '/profile').to route_to(
      controller: 'profiles',
      action: 'show',
    )
  end

  it 'routes GET /profile/edit to profile#edit' do
    expect(get: '/profile/edit').to route_to(
      controller: 'profiles',
      action: 'edit',
    )
  end

  it 'routes PATCH /profile to profile#update' do
    expect(patch: '/profile').to route_to(
      controller: 'profiles',
      action: 'update',
    )
  end
end
