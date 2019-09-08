class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update,:index]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end


  def show
    redirect_to root_url and return unless @user.activated
  end


  def new
    @user = User.new
  end


  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "メールを送信しました。メールを確認してアカウントを有効化して下さい。"
      redirect_to root_url
    else
      render "new"
    end
  end


  def update
    if @user.update_attributes(user_params)
      flash[:success] = "更新しました。"
      redirect_to @user
    else
      render "edit"
    end
  end


  def destroy
    @user.destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
       unless current_user?(@user)
         flash[:danger] ="別のユーザーの編集はできません"
         redirect_to user_url(current_user)
       end
    end

end
