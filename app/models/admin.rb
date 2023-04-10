class Admin < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@tamu\.edu\z/i, message: 'Email must be valid'}
  validates :phone, presence: true, format: { with: /\A(\+\d{1,2}\s?)?(\(\d{3}\)|\d{3})[\s.-]?\d{3}[\s.-]?\d{4}\z/, message: 'Phone must be valid'}
  validates :role, presence: true, format: { with: /\A(member|leader|executive)\z/i, message: 'Role must be valid'}

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@gmail.com || @tamu.edu\z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

end
