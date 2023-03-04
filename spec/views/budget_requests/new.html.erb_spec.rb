require 'rails_helper'

RSpec.describe "budget_requests/new", type: :view do
  before(:each) do
    assign(:budget_request, BudgetRequest.new())
  end

  it "renders new budget_request form" do
    render

    assert_select "form[action=?][method=?]", budget_requests_path, "post" do
    end
  end
end
