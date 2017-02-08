module Admin
  class ActionsController < Admin::ApplicationController
    before_action :set_action, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized

    def index
      @actions = Action.all
      authorize @actions
    end

    def show
      authorize @action
    end

    def new
      @action = Action.new
      authorize @action
    end

    def edit
      authorize @action
    end

    def create
      @action = Action.new(action_params)
      authorize @action

      if @action.save
        redirect_to(
          [:admin, @action], notice: 'Action was successfully created.'
        )
      else
        render :new
      end
    end

    def update
      authorize @action
      if @action.update(action_params)
        redirect_to(
          [:admin, @action], notice: 'Action was successfully updated.'
        )
      else
        render :edit
      end
    end

    def destroy
      authorize @action
      @action.destroy
      redirect_to(
        admin_actions_url, notice: 'Action was successfully removed.'
      )
    end

    private

    def set_action
      @action = Action.find(params[:id])
    end

    def action_params
      params.require(:action_item).permit(
        :body, :category_id, :event, :eyebrow, :happening_at, :image,
        :issue_id, :location, :priority, :summary, :remove_image,
        :time_commitment, :title
      )
    end
  end
end
