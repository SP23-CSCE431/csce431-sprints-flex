class BudgetReviewsController < ApplicationController
  before_action :set_budget_request, only: %i[ approve deny ]

  def index
    @user_id = current_admin.id
    @pending_budgets = BudgetRequest.paginate(page: params[:page], per_page: 10).where(is_approved: nil)
    @pending_budgets_count = BudgetRequest.where(is_approved: nil).count
  end   

  def approve
    pending_budget = BudgetRequest.find(params[:budget_request_id])
    pending_budget.budget_request.update(is_approved: true)
    redirect_to budget_reviews_path
  end    

  def deny
    pending_budget = BudgetRequest.find(params[:budget_request_id])
    pending_budget.budget_request.update(is_approved: false)
    redirect_to budget_reviews_path
  end  

  private

  def set_budget_request
    @budget_request = BudgetRequest.find(params[:id])
  end

end    