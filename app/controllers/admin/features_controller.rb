module Admin
  class FeaturesController < Admin::ApplicationController
    before_action :set_feature, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized

    def create
      @feature = Feature.new(feature_params)
      authorize @feature

      if @feature.save
        redirect_to(
          [:admin, @feature], notice: 'Feature was successfully created.'
        )
      else
        render :new
      end
    end

    def destroy
      authorize @feature
      @feature.destroy
      redirect_to(
        admin_features_url, notice: 'Feature was successfully removed.'
      )
    end

    def edit
      authorize @feature
    end

    def index
      @features = Feature.order(position: :asc).all
      authorize @features
    end

    def new
      @feature = Feature.new
      authorize @feature
    end

    def show
      authorize @feature
    end

    # rubocop:disable Metrics/MethodLength
    def update
      authorize @feature
      respond_to do |format|
        if @feature.update(feature_params)
          format.html do
            redirect_to(
              [:admin, @feature], notice: 'Feature was successfully updated.'
            )
          end
        else
          format.html { render :edit }
        end
        format.js
      end
    end

    private

    def set_feature
      @feature = Feature.find(params[:id])
    end

    def feature_params
      params.require(:feature).permit(
        :action_id, :position
      )
    end
  end
end
