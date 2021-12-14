# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  enum role: { passenger: 0, conductor: 1, admin: 2 }

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def api_token
    ApiToken.new.encode(user_id: id, email: email)
  end
end
