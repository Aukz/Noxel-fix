module NovelsHelper


  def right_user
    current_user.novels.find_by(id: params[:id])
  end
end
