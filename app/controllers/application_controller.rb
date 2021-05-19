class ApplicationController < ActionController::Base
  before_action :current_user
  
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def autheniticate_user
    if @current_user == nil
      flash[:success] = "ログインが必要です"
      redirect_to login_path
    end
  end
  
  def is_login?
    if @current_user 
      flash[:success] = "すでにログインしています"
      redirect_to products_path
    end
  end
end
