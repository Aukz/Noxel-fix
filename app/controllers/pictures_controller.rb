class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new,:create,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  require "mini_magick"

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.create(picture_params)
    if @picture.save
      flash[:success] = "イラストを投稿しました"
      redirect_to current_user
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @picture.update_attributes(picture_params)
    if @picture.save
      flash[:success] = "内容を変更しました。"
      redirect_to @picture
    else
      render "edit"
    end
  end

  def show
    @user = User.find_by(id: @picture.user.id)
  end

  def destroy
    @picture.destroy
    flash[:success] = "イラストを削除しました"
    redirect_to current_user
  end


end


    private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title,:picture,:category)
  end

  def correct_user
     @picture = Picture.find(params[:id])
     @user = @picture.user
     unless correct_user_picture(@user)
      flash[:danger] = "別のユーザーの作品は変更出来ません"
      redirect_to current_user
    end
  end
