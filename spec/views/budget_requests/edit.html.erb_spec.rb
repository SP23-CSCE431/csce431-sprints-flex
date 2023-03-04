require 'rails_helper'

RSpec.describe "budget_requests/edit", type: :view do
  let(:budget_request) {
    BudgetRequest.create!()
  }

  before(:each) do
    assign(:budget_request, budget_request)
  end

  it "renders the edit budget_request form" do
    render

    assert_select "form[action=?][method=?]", budget_request_path(budget_request), "post" do
    end
  end
end
