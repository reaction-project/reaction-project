require 'rails_helper'

RSpec.describe 'routing to root', type: :routing do
  it 'routes / to pages#index' do
    expect(get: '/').to route_to(
      controller: 'pages',
      action: 'home'
    )
  end
end
