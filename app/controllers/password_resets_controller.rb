class PasswordResetsController < ApplicationController

  skip_before_action :authorize_request, only: [:new]

  def new
    json_response(:status => 'success')
  end

  def create
    @user = User.find_by_email(params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
    end
  end

  def edit
    json_response(:status => 'success')
  end
end
