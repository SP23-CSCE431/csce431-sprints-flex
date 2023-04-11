class BudgetRequest < ApplicationRecord
  belongs_to :admin
  validates :admin_id, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :value, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :phone, presence: true, format: { with: /\A(\+\d{1,2}\s?)?(\(\d{3}\)|\d{3})[\s.-]?\d{3}[\s.-]?\d{4}\z/, message: 'Phone must be valid'}
  validates :mailing_address, presence: true
  validates :mail_option, presence: true, format: { with: /\A(sent to mailing address|pick up|direct deposit)\z/i, message: 'Mailing Option must be valid'}
  validates :tamu_affiliation, presence: true, format: { with: /\A(student|employee|unaffiliated)\z/i, message: 'Affiliation must be valid'}
  validates :requester_name, presence: true
  validates :description, presence: true, length: {minimum: 5}
  validates :uin, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
