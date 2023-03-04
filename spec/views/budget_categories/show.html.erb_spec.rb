require 'rails_helper'

RSpec.describe "budget_categories/show", type: :view do
  before(:each) do
    assign(:budget_category, BudgetCategory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
