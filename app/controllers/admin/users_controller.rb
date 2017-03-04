module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized

    def index
      @users = User.order(created_at: :asc).all
      authorize @users
    end

    def show
      authorize @user
    end

    def new
      @user = User.new
      authorize @user
    end

    def edit
      authorize @user
    end

    def create
      @user = User.new(user_params.except(:issue_ids))
      authorize @user

      if @user.save
        update_user_issues
        redirect_to [:admin, @user], notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def update
      authorize @user
      if @user.update(user_params)
        redirect_to [:admin, @user], notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      authorize @user
      @user.destroy
      redirect_to admin_users_url, notice: 'User was successfully removed.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def update_user_issues
      issue_ids = user_params.fetch(:issue_ids, [])
      @user.issue_ids = issue_ids if issue_ids.any?
    end

    def user_params
      params.require(:user).permit(
        :email, :password, :role, issue_ids: []
      )
    end
  end
end
