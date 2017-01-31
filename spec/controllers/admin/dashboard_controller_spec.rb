require 'rails_helper'

module Admin
  RSpec.describe DashboardController, type: :controller do
    let(:admin) { create(:user, :admin) }

    before { sign_in_as(admin) }

    describe 'GET #index' do
      it 'responds successfully' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
