class AuthenticationController < ApplicationController

  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    user = AuthenticateUser.new(auth_params[:email], auth_params[:password]).getUser
    json_response(user: user, auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

end
