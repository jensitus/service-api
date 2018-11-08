class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  def getUser
    user
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = User.find_by(email: email)
    # puts "user: "
    # puts user.inspect
    # puts "user.authenticate(password)"
    # puts user.authenticate(password).inspect
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end