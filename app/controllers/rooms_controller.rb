class RoomsController < ApplicationController
  before_action :logged_in_user

  def create
    if room = Room.find_by(sender_id: current_user.id,receiver_id: params[:user_id])
      redirect_to room
    else
      room = Room.create(sender_id: current_user.id,receiver_id: params[:user_id])
      user = User.find(params[:user_id])
      flash[:success] ="#{user.name}さんとの部屋です"
      redirect_to room
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
  end

end
