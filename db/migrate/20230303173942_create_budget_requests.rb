class CreateBudgetRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_requests do |t|
      t.belongs_to :member, null: false, foreign_key: true
      t.belongs_to :budget_category, null: false, foreign_key: true
      t.boolean :is_approved
      t.string :description
      t.float :value
      
      t.timestamps
    end
  end
end
