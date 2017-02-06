require 'rails_helper'

module Admin
  RSpec.describe IssuesController, type: :controller do
    let(:admin) { create(:user, :admin) }

    before { sign_in_as(admin) }

    let(:valid_attributes) do
      attributes_for(:issue)
    end

    let(:invalid_attributes) do
      attributes_for(:issue, :invalid)
    end

    let(:valid_session) { {} }

    let(:issue) { create(:issue) }

    describe 'GET #index' do
      it 'assigns all issues as @issues' do
        get :index, params: {}, session: valid_session
        expect(assigns(:issues)).to eq([issue])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested issue as @issue' do
        get :show, params: { id: issue.to_param }, session: valid_session
        expect(assigns(:issue)).to eq(issue)
      end
    end

    describe 'GET #new' do
      it 'assigns a new issue as @issue' do
        get :new, params: {}, session: valid_session
        expect(assigns(:issue)).to be_a_new(Issue)
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested issue as @issue' do
        get :edit, params: { id: issue.to_param }, session: valid_session
        expect(assigns(:issue)).to eq(issue)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        it 'creates a new Issue' do
          expect {
            post :create, params: { issue: valid_attributes }, session: valid_session
          }.to change(Issue, :count).by(1)
        end

        it 'assigns a newly created issue as @issue' do
          post :create, params: { issue: valid_attributes }, session: valid_session
          expect(assigns(:issue)).to be_a(Issue)
          expect(assigns(:issue)).to be_persisted
        end

        it 'redirects to the created issue' do
          post :create, params: { issue: valid_attributes }, session: valid_session
          expect(response).to redirect_to([:admin, Issue.last])
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved issue as @issue' do
          post :create, params: { issue: invalid_attributes }, session: valid_session
          expect(assigns(:issue)).to be_a_new(Issue)
        end

        it "re-renders the 'new' template" do
          post :create, params: { issue: invalid_attributes }, session: valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) {
          { name: Faker::Name.name }
        }

        it 'updates the requested issue' do
          put :update, params: { id: issue.to_param, issue: new_attributes }, session: valid_session
          issue.reload
          expect(issue.name).to eq(new_attributes[:name])
        end

        it 'assigns the requested issue as @issue' do
          issue = Issue.create! valid_attributes
          put :update, params: { id: issue.to_param, issue: valid_attributes }, session: valid_session
          expect(assigns(:issue)).to eq(issue)
        end

        it 'redirects to the issue' do
          issue = Issue.create! valid_attributes
          put :update, params: { id: issue.to_param, issue: valid_attributes }, session: valid_session
          expect(response).to redirect_to([:admin, issue])
        end
      end

      context 'with invalid params' do
        it 'assigns the issue as @issue' do
          issue = Issue.create! valid_attributes
          put :update, params: { id: issue.to_param, issue: invalid_attributes }, session: valid_session
          expect(assigns(:issue)).to eq(issue)
        end

        it "re-renders the 'edit' template" do
          issue = Issue.create! valid_attributes
          put :update, params: { id: issue.to_param, issue: invalid_attributes }, session: valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested issue' do
        issue = create(:issue)

        expect {
          delete :destroy, params: { id: issue.to_param }, session: valid_session
        }.to change(Issue, :count).by(-1)
      end

      it 'redirects to the issues list' do
        delete :destroy, params: { id: issue.to_param }, session: valid_session
        expect(response).to redirect_to(admin_issues_url)
      end
    end
  end
end
