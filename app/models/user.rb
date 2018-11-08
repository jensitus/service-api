class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :todos, foreign_key: :created_by

  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
  validates_length_of :password_digest, minimum: 6
  validates_uniqueness_of :name
  validates_length_of :name, minimum: 4

end
