require 'rails_helper'

RSpec.describe "budget_requests/index", type: :view do
  before(:each) do
    assign(:budget_requests, [
      BudgetRequest.create!(),
      BudgetRequest.create!()
    ])
  end

  it "renders a list of budget_requests" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
