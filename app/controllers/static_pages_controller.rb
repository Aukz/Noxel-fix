class StaticPagesController < ApplicationController
  skip_before_action :static_home, only: [:home]
  def home
  end

  def about
  end
end
