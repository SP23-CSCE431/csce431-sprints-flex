class ReplaceMemberWithAdminInBudgetRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :budget_requests, :member_id
    add_reference :budget_requests, :admin, index: true, foreign_key: true
  end
end
