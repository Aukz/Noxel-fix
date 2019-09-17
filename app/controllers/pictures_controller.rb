class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new,:create,:edit,:update,:destroy]
require "mini_magick"

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.create(picture_params)
    redirect_to current_user
  end

  def destroy
  end


end


    private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title, :category)
  end
