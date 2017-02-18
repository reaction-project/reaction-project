class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_profile, only: [:show, :edit, :update]
  after_action :verify_authorized

  def edit
    authorize @profile
  end

  def show
    authorize @profile
  end

  def update
    authorize @profile
    if @profile.update(profile_params)
      redirect_to(
        @profile, notice: 'Profile was successfully updated.'
      )
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :avatar, :facebook, :first_name, :last_name, :medium, :remove_avatar,
      :twitter
    )
  end

  def set_profile
    @profile = current_user.profile
  end
end
