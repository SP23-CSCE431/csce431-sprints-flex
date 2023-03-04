require 'rails_helper'

RSpec.describe "budget_categories/new", type: :view do
  before(:each) do
    assign(:budget_category, BudgetCategory.new())
  end

  it "renders new budget_category form" do
    render

    assert_select "form[action=?][method=?]", budget_categories_path, "post" do
    end
  end
end
