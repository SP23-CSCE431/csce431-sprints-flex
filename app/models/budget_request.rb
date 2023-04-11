class BudgetRequest < ApplicationRecord
  belongs_to :admin
  validates :admin_id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :value, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :phone, presence: true, format: { with: /\A(\+\d{1,2}\s?)?(\(\d{3}\)|\d{3})[\s.-]?\d{3}[\s.-]?\d{4}\z/, message: 'Phone must be valid'}
  validates :mailing_address, presence: true
  validates :mail_option, presence: true
  validates :tamu_affiliation, presence: true
  validates :requester_name, presence: true
  validates :description, presence: true
end
