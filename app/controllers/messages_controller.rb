class MessagesController < ApplicationController
  before_action :logged_in_user

  def create
    if current_user.id == params[:message][:receiver_id].to_i
      message = Message.new(room_id: params[:message][:room_id],content: params[:message][:content],
                receiver_id: params[:message][:sender_id], sender_id: current_user.id)
    elsif current_user.id == params[:message][:sender_id].to_i
      message = Message.new(room_id: params[:message][:room_id],content: params[:message][:content],
                receiver_id: params[:message][:receiver_id],sender_id: current_user.id)
    end
    @room = Room.find(params[:message][:room_id])
    if message != nil
      if message.save
        redirect_to @room
      else
        flash[:danger] ="送信に失敗しました"
        redirect_to @room
      end
    else
      flash[:danger] = "権限がありません"
      redirect_to current_user
    end
  end

end
