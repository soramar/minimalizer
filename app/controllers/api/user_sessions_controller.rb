class Api::UserSessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login, only: %i[create], raise: false

  def create
    if @user = login(params[:email], params[:password])
      render json: { id: @user.id }
    else
      render json: @user.errors, status: :bad_request
    end
  end
end
