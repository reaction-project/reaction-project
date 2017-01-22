require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
end
