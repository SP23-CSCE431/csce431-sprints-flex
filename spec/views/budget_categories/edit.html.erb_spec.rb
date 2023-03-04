require 'rails_helper'

RSpec.describe "budget_categories/edit", type: :view do
  let(:budget_category) {
    BudgetCategory.create!()
  }

  before(:each) do
    assign(:budget_category, budget_category)
  end

  it "renders the edit budget_category form" do
    render

    assert_select "form[action=?][method=?]", budget_category_path(budget_category), "post" do
    end
  end
end
