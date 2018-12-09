class UsersController < ApplicationController
  before_action :set_user, only: :show
  skip_before_action :authorize_request, only: [:create, :check_auth_token]
  # before_action :check_auth_token, only: :check_auth_token

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /signup
  # return authenticated token upon signup
  def create
    if user_params[:password_confirmation].nil?
      response = {message: Message.pw_confirmation_can_not_be_blank}
      return json_response(response, :unprocessable_entity)
    end
    user_params[:email] = user_params[:email].downcase!
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {message: Message.account_created, auth_token: auth_token}
    json_response(response, :created)
  end

  def show

  end

  # POST /users/check_auth_token
  def check_auth_token
    token_valid = JsonWebToken.decode auth_token_params
    json_response(token_valid)
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
    json_response(@user)
  end

  def auth_token_params
    params[:token]
  end

  def check_the_auth_token(token)
    JsonWebToken.decode(token)
  end

end
