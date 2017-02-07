module Admin
  class CategoriesController < Admin::ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized

    def index
      @categories = Category.all
      authorize @categories
    end

    def show
      authorize @category
    end

    def new
      @category = Category.new
      authorize @category
    end

    def edit
      authorize @category
    end

    def create
      @category = Category.new(category_params)
      authorize @category

      if @category.save
        redirect_to(
          [:admin, @category], notice: 'Category was successfully created.'
        )
      else
        render :new
      end
    end

    def update
      authorize @category
      if @category.update(category_params)
        redirect_to(
          [:admin, @category], notice: 'Category was successfully updated.'
        )
      else
        render :edit
      end
    end

    def destroy
      authorize @category
      @category.destroy
      redirect_to(
        admin_categories_url, notice: 'Category was successfully removed.'
      )
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(
        :name, :icon
      )
    end
  end
end
