class ImpressionsController < ApplicationController
  before_action :logged_in_user, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_impression, only: [:edit,:update,:destroy]

  def new
    @impression = Impression.new
  end

  def create
    @story = Story.find(impression_params[:story_id])
    @impression = current_user.impressions.build(impression_params)
    if @impression.save
      flash[:success] ="感想を投稿しました。"
      redirect_to impression_story_path(@story)
    else
      render "new"
    end
  end

  def edit
  end

  def update
     @story = Story.find(impression_params[:story_id])
    if @impression.update_attributes(impression_params)
      flash[:success] = "更新しました。"
      redirect_to impression_story_path(@story.id)
    else
      render "edit"
    end
  end

  def destroy
    @story = Story.find(params[:story_id])
    @impression.destroy
    flash[:success] = "削除しました"
    redirect_to impression_story_path(@story.id)
  end

    private

  def set_impression
    @impression = Impression.find(params[:id])
  end

  def impression_params
    params.require(:impression).permit(:content,:story_id)
  end


end
