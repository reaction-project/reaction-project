require 'rails_helper'

RSpec.describe 'routing to the admin dashboard', type: :routing do
  it 'routes /admin to admin/dashboard#index' do
    expect(get: '/admin').to route_to(
      controller: 'admin/dashboard',
      action: 'index',
    )
  end
end
