require 'rails_helper'

RSpec.describe "budget_requests/show", type: :view do
  before(:each) do
    assign(:budget_request, BudgetRequest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
