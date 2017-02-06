module Admin
  class IssuesController < Admin::ApplicationController
    before_action :set_issue, only: [:show, :edit, :update, :destroy]
    after_action :verify_authorized

    def index
      @issues = Issue.order(name: :asc).all
      authorize @issues
    end

    def show
      authorize @issue
    end

    def new
      @issue = Issue.new
      authorize @issue
    end

    def edit
      authorize @issue
    end

    def create
      @issue = Issue.new(issue_params)
      authorize @issue

      if @issue.save
        redirect_to [:admin, @issue], notice: 'Issue was successfully created.'
      else
        render :new
      end
    end

    def update
      authorize @issue
      if @issue.update(issue_params)
        redirect_to [:admin, @issue], notice: 'Issue was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      authorize @issue
      @issue.destroy
      redirect_to admin_issues_url, notice: 'Issue was successfully removed.'
    end

    private

    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(
        :body, :lead, :name, :icon
      )
    end
  end
end
