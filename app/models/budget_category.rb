class BudgetCategory < ApplicationRecord
    validates :name, presence: true
end
