require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:profile) { create(:profile) }

  before { sign_in_as(profile.user) }

  let(:valid_attributes) {
    attributes_for(:profile).merge(first_name: Faker::Name.first_name)
  }

  let(:invalid_attributes) {
    attributes_for(:profile, :invalid)
  }

  let(:valid_session) { {} }

  let(:profile) { create(:profile) }

  describe 'GET #show' do
    it 'assigns the current user profile as @profile' do
      get :show, params: {}, session: valid_session
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested profile as @profile' do
      get :edit, params: {}, session: valid_session
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { last_name: Faker::Name.last_name }
      }

      it 'updates the requested profile' do
        put :update,
            params: { profile: new_attributes },
            session: valid_session
        profile.reload
        expect(profile.last_name).to eq(new_attributes[:last_name])
      end

      it 'assigns the requested profile as @profile' do
        put :update,
            params: {
              profile: valid_attributes,
            },
            session: valid_session
        expect(assigns(:profile)).to eq(profile)
      end

      it 'redirects to the profile' do
        put :update,
            params: {
              profile: valid_attributes,
            },
            session: valid_session
        expect(response).to redirect_to(profile)
      end
    end
  end
end
