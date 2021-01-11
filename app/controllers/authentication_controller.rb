class AuthenticationController < ApplicationController

  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    puts auth_token
    u = {
        id: user.id,
        name: user.name,
        email: user.email,
        access_token: auth_token
    }
    puts user.inspect
    jr = json_response(user: u)
    puts jr.inspect
    jr
  end

  private

  def user
    user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).getUser
    return user
  end

  def auth_params
    params.permit(:email, :password)
  end

end
