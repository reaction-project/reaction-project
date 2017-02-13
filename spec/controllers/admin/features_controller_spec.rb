require 'rails_helper'

module Admin
  RSpec.describe FeaturesController, type: :controller do
    let(:action) { create(:action) }
    let(:admin) { create(:user, :admin) }

    before { sign_in_as(admin) }

    let(:valid_attributes) {
      attributes_for(:feature).merge(action_id: action.id)
    }

    let(:invalid_attributes) {
      attributes_for(:feature, :invalid)
    }

    let(:valid_session) { {} }

    let(:feature) { create(:feature) }

    describe 'GET #index' do
      it 'assigns all features as @features' do
        get :index, params: {}, session: valid_session
        expect(assigns(:features)).to eq([feature])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested feature as @feature' do
        get :show, params: { id: feature.to_param }, session: valid_session
        expect(assigns(:feature)).to eq(feature)
      end
    end

    describe 'GET #new' do
      it 'assigns a new feature as @feature' do
        get :new, params: {}, session: valid_session
        expect(assigns(:feature)).to be_a_new(Feature)
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested feature as @feature' do
        get :edit, params: { id: feature.to_param }, session: valid_session
        expect(assigns(:feature)).to eq(feature)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Feature' do
          expect {
            post :create,
                 params: { feature: valid_attributes },
                 session: valid_session
          }.to change(Feature, :count).by(1)
        end

        it 'assigns a newly created feature as @feature' do
          post :create,
               params: { feature: valid_attributes },
               session: valid_session
          expect(assigns(:feature)).to be_a(Feature)
        end

        it 'saves the feature' do
          post :create,
               params: { feature: valid_attributes },
               session: valid_session
          expect(assigns(:feature)).to be_persisted
        end

        it 'redirects to the created feature' do
          post :create,
               params: { feature: valid_attributes },
               session: valid_session
          expect(response).to redirect_to([:admin, Feature.last])
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved feature as @feature' do
          post :create,
               params: { feature: invalid_attributes },
               session: valid_session
          expect(assigns(:feature)).to be_a_new(Feature)
        end

        it "re-renders the 'new' template" do
          post :create,
               params: { feature: invalid_attributes },
               session: valid_session
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          { position: 206 }
        }

        it 'updates the requested feature' do
          put :update,
              params: { id: feature.to_param, feature: new_attributes },
              session: valid_session
          feature.reload
          expect(feature.position).to eq(new_attributes[:position])
        end

        it 'assigns the requested feature as @feature' do
          feature = Feature.create! valid_attributes
          put :update,
              params: { id: feature.to_param, feature: valid_attributes },
              session: valid_session
          expect(assigns(:feature)).to eq(feature)
        end

        it 'redirects to the feature' do
          feature = Feature.create! valid_attributes
          put :update,
              params: { id: feature.to_param, feature: valid_attributes },
              session: valid_session
          expect(response).to redirect_to([:admin, feature])
        end
      end

      context 'with invalid params' do
        it 'assigns the feature as @feature' do
          feature = Feature.create! valid_attributes
          put :update,
              params: { id: feature.to_param, feature: invalid_attributes },
              session: valid_session
          expect(assigns(:feature)).to eq(feature)
        end

        it "re-renders the 'edit' template" do
          feature = Feature.create! valid_attributes
          put :update,
              params: { id: feature.to_param, feature: invalid_attributes },
              session: valid_session
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested feature' do
        feature = create(:feature)

        expect {
          delete :destroy,
                 params: { id: feature.to_param },
                 session: valid_session
        }.to change(Feature, :count).by(-1)
      end

      it 'redirects to the features list' do
        delete :destroy,
               params: { id: feature.to_param },
               session: valid_session
        expect(response).to redirect_to(admin_features_url)
      end
    end
  end
end
