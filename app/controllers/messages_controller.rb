class MessagesController < ApplicationController
  before_action :logged_in_user

  def create
    message = Message.new(room_id: params[:message][:room_id],content: params[:message][:content],
              receiver_id: params[:message][:receiver_id],sender_id: current_user.id)
    if message.save
      redirect_to "/rooms/#{params[:message][:room_id]}"
    # else
    #   redirect_to "rooms/#{params[:room_id]}",danger: "メッセージの送信に失敗しました"
    end
  end

end
