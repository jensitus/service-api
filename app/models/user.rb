class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :todos, foreign_key: :created_by

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password_digest, presence: true, length: {minimum: 6}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  validates :name, presence: true, length: {minimum: 4, maximum: 30}, uniqueness: true

end
