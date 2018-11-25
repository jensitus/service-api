class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.pw_can_not_be_blank
    "Password can't be empty"
  end

  def self.pw_confirmation_can_not_be_blank
    'Account could not be created: Password Confirmation must not be blank'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end

  def self.pw_to_short
    'Password must be at least 6 characters'
  end

  def self.reset_password_instructions_sent
    "We've sent you an email with instructions how to reset your password, check your mail!"
  end

  def self.email_not_found
    'Email address not found'
  end

  def self.we_tried_real_hard
    "We tried real hard to change your password"
  end

end