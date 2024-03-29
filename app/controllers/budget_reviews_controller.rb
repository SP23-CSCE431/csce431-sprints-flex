class BudgetReviewsController < ApplicationController
  def index
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    @user_id = current_admin.id
    @pending_budgets = BudgetRequest.paginate(page: params[:page], per_page: 5).where(is_approved: nil)
    @pending_budgets_count = BudgetRequest.where(is_approved: nil).count
  end

  def approve
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    pending_budget = BudgetRequest.find(params[:budget_request_id])
    pending_budget.update(is_approved: true)
    redirect_to(budget_reviews_path)
  end

  def deny
    if current_admin.role == "Member"
      redirect_to(points_path)
    end
    pending_budget = BudgetRequest.find(params[:budget_request_id])
    pending_budget.update(is_approved: false)
    redirect_to(budget_reviews_path)
  end
end
