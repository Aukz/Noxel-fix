module PicturesHelper

  def correct_user_picture(user)
    current_user == user
  end
end
