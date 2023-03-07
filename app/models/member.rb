class Member < ApplicationRecord
      validates :first_name, presence: true
      validates :last_name, presence: true
      validates :email, presence: true, format: { with: /\A[\w+\-.]+@tamu\.edu\z/i, message: 'Email must be valid'}
      validates :phone, presence: true, format: { with: /\A(\+\d{1,2}\s?)?(\(\d{3}\)|\d{3})[\s.-]?\d{3}[\s.-]?\d{4}\z/, message: 'Phone must be valid'}
      validates :role, presence: true, format: { with: /\A(member|leader|executive)\z/i, message: 'Role must be valid'}
end
