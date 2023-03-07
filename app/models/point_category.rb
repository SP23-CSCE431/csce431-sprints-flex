class PointCategory < ApplicationRecord
      validates :name, presence: true, length: {minimum: 4}, format: {without: /\A\d+\z/}
      validates :value, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
