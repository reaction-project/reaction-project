require 'rails_helper'

module Admin
  RSpec.describe CategoriesController, type: :controller do
    let(:admin) { create(:user, :admin) }

    before { sign_in_as(admin) }

    let(:valid_attributes) {
      attributes_for(:category)
    }

    let(:invalid_attributes) {
      attributes_for(:category, :invalid)
    }

    let(:valid_session) { {} }

    let(:category) { create(:category) }

    describe 'GET #index' do
      it 'assigns all categories as @categories' do
        get :index, params: {}, session: valid_session
        expect(assigns(:categories)).to eq([category])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested category as @category' do
        get :show, params: { id: category.to_param }, session: valid_session
        expect(assigns(:category)).to eq(category)
      end
    end

    describe 'GET #new' do
      it 'assigns a new category as @category' do
        get :new, params: {}, session: valid_session
        expect(assigns(:category)).to be_a_new(Category)
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested category as @category' do
        get :edit, params: { id: category.to_param }, session: valid_session
        expect(assigns(:category)).to eq(category)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Category' do
          expect {
            post :create, params: { category: valid_attributes }, session: valid_session
          }.to change(Category, :count).by(1)
        end

        it 'assigns a newly created category as @category' do
          post :create, params: { category: valid_attributes }, session: valid_session
          expect(assigns(:category)).to be_a(Category)
          expect(assigns(:category)).to be_persisted
        end

        it 'redirects to the created category' do
          post :create, params: { category: valid_attributes }, session: valid_session
          expect(response).to redirect_to([:admin, Category.last])
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved category as @category' do
          post :create, params: { category: invalid_attributes }, session: valid_session
          expect(assigns(:category)).to be_a_new(Category)
        end

        it "re-renders the 'new' template" do
          post :create, params: { category: invalid_attributes }, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          { name: Faker::Name.name }
        }

        it 'updates the requested category' do
          put :update, params: { id: category.to_param, category: new_attributes }, session: valid_session
          category.reload
          expect(category.name).to eq(new_attributes[:name])
        end

        it 'assigns the requested category as @category' do
          category = Category.create! valid_attributes
          put :update, params: { id: category.to_param, category: valid_attributes }, session: valid_session
          expect(assigns(:category)).to eq(category)
        end

        it 'redirects to the category' do
          category = Category.create! valid_attributes
          put :update, params: { id: category.to_param, category: valid_attributes }, session: valid_session
          expect(response).to redirect_to([:admin, category])
        end
      end

      context 'with invalid params' do
        it 'assigns the category as @category' do
          category = Category.create! valid_attributes
          put :update, params: { id: category.to_param, category: invalid_attributes }, session: valid_session
          expect(assigns(:category)).to eq(category)
        end

        it "re-renders the 'edit' template" do
          category = Category.create! valid_attributes
          put :update, params: { id: category.to_param, category: invalid_attributes }, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested category' do
        category = create(:category)

        expect {
          delete :destroy, params: { id: category.to_param }, session: valid_session
        }.to change(Category, :count).by(-1)
      end

      it 'redirects to the categories list' do
        delete :destroy, params: { id: category.to_param }, session: valid_session
        expect(response).to redirect_to(admin_categories_url)
      end
    end
  end
end
