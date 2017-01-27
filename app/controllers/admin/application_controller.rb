module Admin
  class ApplicationController < ActionController::Base
    include Clearance::Controller
    include ::Pundit

    layout 'admin'

    before_action :require_login
    before_action :authenticate_admin

    private

    def authenticate_admin
      redirect_to sign_in_url unless signed_in? && current_user.admin?
    end
  end
end
