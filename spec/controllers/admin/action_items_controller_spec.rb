require 'rails_helper'

module Admin
  RSpec.describe ActionItemsController, type: :controller do
    let(:admin) { create(:user, :admin) }
    let(:category) { create(:category) }
    let(:issue) { create(:issue) }

    before { sign_in_as(admin) }

    let(:valid_attributes) {
      attributes_for(:action_item).merge(
        category_id: category.id, issue_id: issue.id,
      )
    }

    let(:invalid_attributes) {
      attributes_for(:action_item, :invalid)
    }

    let(:valid_session) { {} }

    let(:action_item) { create(:action_item) }

    describe 'GET #index' do
      it 'assigns all action items as @action_items' do
        get :index, params: {}, session: valid_session
        expect(assigns(:action_items)).to eq([action_item])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested action item as @action_item' do
        get :show, params: { id: action_item.to_param }, session: valid_session
        expect(assigns(:action_item)).to eq(action_item)
      end
    end

    describe 'GET #new' do
      it 'assigns a new action item as @action_item' do
        get :new, params: {}, session: valid_session
        expect(assigns(:action_item)).to be_a_new(ActionItem)
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested action item as @action_item' do
        get :edit, params: { id: action_item.to_param }, session: valid_session
        expect(assigns(:action_item)).to eq(action_item)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new ActionItem' do
          expect {
            post :create,
                 params: { action_item: valid_attributes },
                 session: valid_session
          }.to change(ActionItem, :count).by(1)
        end

        it 'assigns a newly created action item as @action_item' do
          post :create,
               params: { action_item: valid_attributes },
               session: valid_session
          expect(assigns(:action_item)).to be_an(ActionItem)
        end

        it 'saves the action_item' do
          post :create,
               params: { action_item: valid_attributes },
               session: valid_session
          expect(assigns(:action_item)).to be_persisted
        end

        it 'redirects to the created action item' do
          post :create,
               params: { action_item: valid_attributes },
               session: valid_session
          expect(response).to redirect_to([:admin, ActionItem.last])
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved action item as @action_item' do
          post :create,
               params: { action_item: invalid_attributes },
               session: valid_session
          expect(assigns(:action_item)).to be_a_new(ActionItem)
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

        it 'updates the requested action item' do
          put :update,
              params: { id: action_item.to_param, action_item: new_attributes },
              session: valid_session
          action_item.reload
          expect(action_item.title).to eq(new_attributes[:title])
        end

        it 'assigns the requested action item as @action_item' do
          action_item = ActionItem.create! valid_attributes
          put :update,
              params: {
                id: action_item.to_param,
                action_item: valid_attributes,
              },
              session: valid_session
          expect(assigns(:action_item)).to eq(action_item)
        end

        it 'redirects to the action item' do
          action_item = ActionItem.create! valid_attributes
          put :update,
              params: {
                id: action_item.to_param,
                action_item: valid_attributes,
              },
              session: valid_session
          expect(response).to redirect_to([:admin, action_item])
        end
      end

      context 'with invalid params' do
        it 'assigns the action item as @action_item' do
          action_item = ActionItem.create! valid_attributes
          put :update,
              params: {
                id: action_item.to_param,
                action_item: invalid_attributes,
              },
              session: valid_session
          expect(assigns(:action_item)).to eq(action_item)
        end

        it "re-renders the 'edit' template" do
          action_item = ActionItem.create! valid_attributes
          put :update,
              params: {
                id: action_item.to_param,
                action_item: invalid_attributes,
              },
              session: valid_session
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested action item' do
        action_item = create(:action_item)

        expect {
          delete :destroy,
                 params: { id: action_item.to_param },
                 session: valid_session
        }.to change(ActionItem, :count).by(-1)
      end

      it 'redirects to the action items list' do
        delete :destroy,
               params: { id: action_item.to_param },
               session: valid_session
        expect(response).to redirect_to(admin_action_items_url)
      end
    end
  end
end
