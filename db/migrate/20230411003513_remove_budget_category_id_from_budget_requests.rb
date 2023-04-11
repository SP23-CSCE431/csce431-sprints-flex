class RemoveBudgetCategoryIdFromBudgetRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :budget_requests, :budget_category_id, :integer
  end
end
