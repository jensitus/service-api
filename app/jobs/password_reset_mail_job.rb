class PasswordResetMailJob < ApplicationJob
  queue_as :default

  def perform(user, reset_token)
    puts "user_name:"
    puts ENV["MAIL_USER"]
    puts "password:"
    puts ENV["MAIL_PW"]
    user.send_password_reset_email(reset_token)
  end
end
