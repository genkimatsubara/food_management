class SessionsController < ApplicationController
  before_action :is_login?, {only: [:new, :create]}
  #ログイン中のユーザーはログイン画面にアクセスできない
  def new
  end
  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "ログインしました"
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが誤っています'
      render :new
    end
  end
  
  def destroy
    reset_session
    flash[:success] = "ログアウトしました"
    redirect_to root_path
  end
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
