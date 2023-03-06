class BudgetRequest < ApplicationRecord
    belongs_to :admin
    belongs_to :budget_category
    validates :admin_id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :budget_category_id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :value, presence: true, numericality: {greater_than_or_equal_to: 0}
end
