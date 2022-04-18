class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  skip_before_action :require_login, only: %i[create], raise: false

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created 
    else
      render json: @user.errors, status: :bad_request
    end
  end

private

  def user_params
      params.permit(:name, :email, :password, :password_confirmation)
  end
end