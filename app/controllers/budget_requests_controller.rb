class BudgetRequestsController < ApplicationController
  before_action :set_budget_request, only: %i[show edit update destroy]

  # GET /budget_requests or /budget_requests.json
  # Query all budget request object related to a user id
  def index
    @budget_requests = BudgetRequest.all
    @user_id = current_admin.id
    @budget_requests = BudgetRequest.where(admin_id: @user_id)
  end

  # GET /budget_requests/1 or /budget_requests/1.json
  def show
  end

  # GET /budget_requests/new
  def new
    @budget_request = BudgetRequest.new
  end

  # GET /budget_requests/1/edit
  def edit
  end

  # POST /budget_requests or /budget_requests.json
  # Create a new budget request object, set the user id to the signed in user,
  # and default approval status to none
  def create
    @user_id = current_admin.id
    @budget_request = BudgetRequest.new(budget_request_params)
    @budget_request.admin_id = @user_id
    @budget_request.is_approved = nil

    respond_to do |format|
      if @budget_request.save
        format.html { redirect_to(budget_request_url(@budget_request), notice: "Reimbursement request was successfully created.") }
        format.json { render(:show, status: :created, location: @budget_request) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @budget_request.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /budget_requests/1 or /budget_requests/1.json
  # Update a budget request
  def update
    respond_to do |format|
      if @budget_request.update(budget_request_params)
        format.html { redirect_to(budget_request_url(@budget_request), notice: "Reimbursement request was successfully updated.") }
        format.json { render(:show, status: :ok, location: @budget_request) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @budget_request.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /budget_requests/1 or /budget_requests/1.json
  # Delete a budget request
  def destroy
    @budget_request.destroy

    respond_to do |format|
      format.html { redirect_to(budget_requests_url, notice: "Reimbursement request was successfully deleted.") }
      format.json { head(:no_content) }
    end
  end

  def delete_requests
    # Delete all requests, will be called from requests
    if current_admin.role == "Executive"
      BudgetRequest.delete_all
      flash[:notice] = 'All reimbursement requests have been successfully deleted.'
    else
      flash[:notice] = 'Permission Denied.'
    end
    redirect_to budget_requests_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_request
    @budget_request = BudgetRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def budget_request_params
    params.require(:budget_request).permit(:admin_id, :is_approved, :value, :description, :requester_name, :phone, :mailing_address, :mail_option, :tamu_affiliation, :uin)
  end
end
