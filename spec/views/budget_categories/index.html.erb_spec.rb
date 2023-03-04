require 'rails_helper'

RSpec.describe "budget_categories/index", type: :view do
  before(:each) do
    assign(:budget_categories, [
      BudgetCategory.create!(),
      BudgetCategory.create!()
    ])
  end

  it "renders a list of budget_categories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
