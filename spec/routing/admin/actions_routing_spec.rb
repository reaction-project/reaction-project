require 'rails_helper'

RSpec.describe Admin::ActionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/actions').to route_to('admin/actions#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/actions/new')
        .to route_to('admin/actions#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/actions/1')
        .to route_to('admin/actions#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/actions/1/edit')
        .to route_to('admin/actions#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/actions')
        .to route_to('admin/actions#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/actions/1')
        .to route_to('admin/actions#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/actions/1')
        .to route_to('admin/actions#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/actions/1')
        .to route_to('admin/actions#destroy', id: '1')
    end
  end
end
