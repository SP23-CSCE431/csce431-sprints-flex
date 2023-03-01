class Point < ApplicationRecord
    belongs_to :admin
    belongs_to :point_category
    validates :admin_id, presence: true
    validates :point_category_id, presence: true
end
