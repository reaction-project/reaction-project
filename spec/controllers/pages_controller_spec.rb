require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'responds successfully' do
      get :home
      expect(response).to be_success
    end

    it 'returns the correct status code' do
      get :home
      expect(response).to have_http_status(200)
    end

    it 'renders the home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end
end
