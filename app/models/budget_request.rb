class BudgetRequest < ApplicationRecord
    belongs_to :admin
    belongs_to :budget_category
    validates :admin_id, presence: true
    validates :budget_category_id, presence: true
end
