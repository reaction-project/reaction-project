require 'rails_helper'

module Admin
  RSpec.describe ActionsController, type: :controller do
    let(:admin) { create(:user, :admin) }
    let(:category) { create(:category) }
    let(:issue) { create(:issue) }

    before { sign_in_as(admin) }

    let(:valid_attributes) {
      attributes_for(:action).merge(
        category_id: category.id, issue_id: issue.id,
      )
    }

    let(:invalid_attributes) {
      attributes_for(:action, :invalid)
    }

    let(:valid_session) { {} }

    let(:action) { create(:action) }

    describe 'GET #index' do
      it 'assigns all actions as @actions' do
        get :index, params: {}, session: valid_session
        expect(assigns(:actions)).to eq([action])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested action as @action' do
        get :show, params: { id: action.to_param }, session: valid_session
        expect(assigns(:action)).to eq(action)
      end
    end

    describe 'GET #new' do
      it 'assigns a new action as @action' do
        get :new, params: {}, session: valid_session
        expect(assigns(:action)).to be_a_new(Action)
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested action as @action' do
        get :edit, params: { id: action.to_param }, session: valid_session
        expect(assigns(:action)).to eq(action)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Action' do
          expect {
            post :create,
                 params: { action_item: valid_attributes },
                 session: valid_session
          }.to change(Action, :count).by(1)
        end

        it 'assigns a newly created action as @action' do
          post :create,
               params: { action_item: valid_attributes },
               session: valid_session
          expect(assigns(:action)).to be_an(Action)
        end

        it 'saves the action' do
          post :create,
               params: { action_item: valid_attributes },
               session: valid_session
          expect(assigns(:action)).to be_persisted
        end

        it 'redirects to the created action' do
          post :create,
               params: { action_item: valid_attributes },
               session: valid_session
          expect(response).to redirect_to([:admin, Action.last])
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved action as @action' do
          post :create,
               params: { action_item: invalid_attributes },
               session: valid_session
          expect(assigns(:action)).to be_a_new(Action)
        end

        it "re-renders the 'new' template" do
          post :create,
               params: { action_item: invalid_attributes },
               session: valid_session
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          { title: Faker::Lorem.sentence }
        }

        it 'updates the requested action' do
          put :update,
              params: { id: action.to_param, action_item: new_attributes },
              session: valid_session
          action.reload
          expect(action.title).to eq(new_attributes[:title])
        end

        it 'assigns the requested action as @action' do
          action = Action.create! valid_attributes
          put :update,
              params: {
                id: action.to_param,
                action_item: valid_attributes,
              },
              session: valid_session
          expect(assigns(:action)).to eq(action)
        end

        it 'redirects to the action' do
          action = Action.create! valid_attributes
          put :update,
              params: {
                id: action.to_param,
                action_item: valid_attributes,
              },
              session: valid_session
          expect(response).to redirect_to([:admin, action])
        end
      end

      context 'with invalid params' do
        it 'assigns the action as @action' do
          action = Action.create! valid_attributes
          put :update,
              params: {
                id: action.to_param,
                action_item: invalid_attributes,
              },
              session: valid_session
          expect(assigns(:action)).to eq(action)
        end

        it "re-renders the 'edit' template" do
          action = Action.create! valid_attributes
          put :update,
              params: {
                id: action.to_param,
                action_item: invalid_attributes,
              },
              session: valid_session
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested action' do
        action = create(:action)

        expect {
          delete :destroy,
                 params: { id: action.to_param },
                 session: valid_session
        }.to change(Action, :count).by(-1)
      end

      it 'redirects to the actions list' do
        delete :destroy,
               params: { id: action.to_param },
               session: valid_session
        expect(response).to redirect_to(admin_actions_url)
      end
    end
  end
end
