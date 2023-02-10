class Point < ApplicationRecord
  belongs_to :member
  belongs_to :point_category
end
