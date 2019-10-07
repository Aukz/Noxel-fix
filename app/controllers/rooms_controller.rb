class RoomsController < ApplicationController
  before_action :logged_in_user

  def create
    if room = Room.find_by(sender_id: current_user.id,receiver_id: params[:user_id])
      redirect_to room
    else
      room = Room.create(sender_id: current_user.id,receiver_id: params[:user_id])
      redirect_to room, success: "メッセージを開始しました"
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new(room_id: @room.id)
  end

end
