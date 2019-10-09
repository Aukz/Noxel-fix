module RoomsHelper
  def room?(sender,receiver)
    Room.find_by(sender_id: sender.id,receiver_id: receiver.id)
  end

  def dm_room(user)
    Room.find_by(sender_id: user.id)
  end
end
