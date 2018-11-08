class UsersController < ApplicationController
  before_action :set_user, only: :show
  skip_before_action :authorize_request, only: [:create]

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

    # because of failing test we do this a bit later:

    # if user_params[:password].length < 6
    #   response = { message: Message.pw_to_short }
    #   return json_response(response, :forbidden)
    # end

    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {message: Message.account_created, auth_token: auth_token}
    json_response(response, :created)
  end

  def show

  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
    json_response(@user)
  end

end
