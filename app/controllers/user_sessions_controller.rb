class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create destroy]

  def new; end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_back_or_to login_path
  end
end
