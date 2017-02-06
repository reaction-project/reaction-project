module Admin
  class ActionItemsController < Admin::ApplicationController
    before_action :set_action_item, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized

    def index
      @action_items = ActionItem.all
      authorize @action_items
    end

    def show
      authorize @action_item
    end

    def new
      @action_item = ActionItem.new
      authorize @action_item
    end

    def edit
      authorize @action_item
    end

    def create
      @action_item = ActionItem.new(action_item_params)
      authorize @action_item

      if @action_item.save
        redirect_to(
          [:admin, @action_item], notice: 'Action was successfully created.'
        )
      else
        render :new
      end
    end

    def update
      authorize @action_item
      if @action_item.update(action_item_params)
        redirect_to(
          [:admin, @action_item], notice: 'Action was successfully updated.'
        )
      else
        render :edit
      end
    end

    def destroy
      authorize @action_item
      @action_item.destroy
      redirect_to(
        admin_action_items_url, notice: 'Action was successfully removed.'
      )
    end

    private

    def set_action_item
      @action_item = ActionItem.find(params[:id])
    end

    def action_item_params
      params.require(:action_item).permit(
        :body, :category_id, :event, :eyebrow, :happening_at, :image,
        :issue_id, :location, :priority, :summary, :remove_image,
        :time_commitment, :title
      )
    end
  end
end
