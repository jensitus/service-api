class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # before_save :downcase_email
  attr_accessor :reset_token

  # has_many :todos, foreign_key: :created_by
  has_and_belongs_to_many :todos

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  validates :name, presence: true, length: {minimum: 4, maximum: 30}, uniqueness: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email(reset_token)
    puts "user_name: ENV['MAIL_USER']"
    puts ENV['MAIL_USER']
    puts ENV['MAIL_PW']
    UserMailer.password_reset(self, reset_token).deliver_now
  end

  def password_reset_expired
    reset_sent_at < 2.hours.ago
  end

  def check_token_valid(token)
    puts token
    BCrypt::Password.new(reset_digest).is_password?(token)
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end
