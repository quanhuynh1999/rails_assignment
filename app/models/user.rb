class User < ApplicationRecord
  has_many :activities
  before_save {self.email = email.downcase}
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}
  has_secure_password
end