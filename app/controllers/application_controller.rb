class ApplicationController < ActionController::Base
  include SessionsHelper
  include NovelsHelper
  include PicturesHelper
  include RoomsHelper


  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
end
