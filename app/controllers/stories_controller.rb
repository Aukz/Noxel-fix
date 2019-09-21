class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new,:create,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit,:update,:destroy]

  def new
    @story =Story.new
  end

    private

    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title, :text)
    end

    def correct_user
       @story = Story.find[:id]
       @novel = @story.novel
       unless current_user.story?(@novel)
        flash[:danger] = "別のユーザーの作品は変更出来ません"
        redirect_to current_user
      end
    end

end
