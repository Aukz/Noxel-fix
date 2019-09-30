class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new,:create,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit,:update,:destroy]
  before_action :new_story, only: [:new]

  def new
    @story =Story.new
  end

  def create
    @novel = Novel.find(params[:novel_id])
    @story = @novel.stories.build(story_params)
    if @story.save
      flash[:success] = "投稿に成功しました"
      redirect_to novel_path(@story.novel.id)
    else
      render "new"
    end
  end

  def show
    store_location
    @novel = @story.novel
  end

  def edit
  end

  def update
    @story.update_attributes(story_params)
    if @story.save
      flash[:success] ="更新しました"
      redirect_to @story
    else
      render "edit"
    end
  end

  def destroy
    @novel = @story.novel
    @story.destroy
    flash[:success] = "削除しました"
    redirect_to @novel
  end

    private

    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title, :content)
    end

    def correct_user
       @story = Story.find(params[:id])
       @novel = @story.novel
       unless current_user.story?(@novel)
        flash[:danger] = "別のユーザーの作品は変更出来ません"
        redirect_to current_user
      end
    end

    def new_story
      @novel = Novel.find(params[:novel_id])
        unless current_user == @novel.user
          flash[:danger] = "別のユーザーの作品の話は作れません"
          redirect_to current_user
        end
    end
end
