class AuthenticationController < ApplicationController

  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    puts auth_token
    puts user
    json_response(auth_token: auth_token, user: user)
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
