class PasswordResetMailJob < ApplicationJob
  queue_as :default

  def perform(user, reset_token)
    puts user.inspect
    user.send_password_reset_email(reset_token)
  end
end
