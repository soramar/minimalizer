class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session  

  protected

  def not_authenticated
    redirect_to login_url, alert: 'ログインしてください'
  end
end
