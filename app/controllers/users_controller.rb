class UsersController < ApplicationController
  before_action :autheniticate_user,{only:[:index,:show,:edit,:update]}
  #ログインしているのかを確かめる
  before_action :ensure_correct_user, {only: [:show, :edit, :update]}
  #ユーザーの編集ができるのはそのユーザー自身だけにする
  before_action :is_login?, {only: [:new, :create]}
  #ログイン中のユーザーは新規登録画面にアクセスできない
  before_action :set_user, {only: [:show, :edit, :update]}
  # 共通部分
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #新規登録をしたそのままログイン状態にする
      flash[:success] = "ようこそ！#{@user.name}さん"
      redirect_to products_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:success] = "権限がありません"
      redirect_to products_path
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
