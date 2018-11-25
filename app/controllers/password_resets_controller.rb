class PasswordResetsController < ApplicationController

  skip_before_action :authorize_request, only: [:new, :edit, :create, :update]
  before_action :forgot_params, only: [:create]
  before_action :reset_params, only: [:edit, :update]
  before_action :get_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  before_action :check_token, only: [:edit, :update]

  def new
    response = {message: 'yes'}
    json_response(response, 200)
  end

  def create
    # @user = User.find_by(email: params[:password_reset][:email].downcase)
    @user = User.find_by(email: forgot_params[:email].downcase)
    if @user
      @user.create_reset_digest
      reset_token = @user.reset_token
      PasswordResetMailJob.perform_later(@user, reset_token)
      # @user.send_password_reset_email
      response = {message: Message.reset_password_instructions_sent}
      json_response(response, 200)
    else
      response = {message: Message.email_not_found}
      json_response(response, :unprocessable_entity)
    end
  end

  def edit
    response = {message: Message.we_tried_real_hard}
    json_response(response, 'success')
  end

  def update
    if reset_params[:password].empty?
      response = {message: Message.pw_can_not_be_blank}
    elsif @user.update_attributes(reset_params)
      response = {message: Message.we_tried_real_hard}
    end
    json_response(response)
  end

  private

  def get_user
    puts reset_params[:email].inspect
    @user = User.find_by(email: reset_params[:email])
  end

  def forgot_params
    params.permit(:email, :password_reset)
  end

  def reset_params
    params.permit(:email, :password, :password_confirmation, :token, :password_reset)
    # params.permit(:email, :password, :password_confirmation)
  end

  def check_expiration
    if @user.password_reset_expired
      json_response(:status => 204)
      # else
      #   json_response(:status => 200)
    end
  end

  def check_token
    if !@user.check_token_valid(reset_params[:token])
      json_response(message: Message.invalid_token)
    end
  end

end
