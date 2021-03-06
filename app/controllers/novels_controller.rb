class NovelsController < ApplicationController
  before_action :set_novel, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new,:create,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit,:update,:destroy]



  def index
    @novels = Novel.search(seach_params[:novel])
  end


  def show
    @user = User.find_by(id: @novel.user.id)
    @stories = @novel.stories.page(params[:page]).per(60)
    @tag = Tag.new
  end


  def new
    @novel = Novel.new
  end

  def create
    @novel = current_user.novels.build(novel_params)
     if @novel.save
       flash[:success] ="小説を作りました！"
       redirect_to current_user
     else
       render "new"
     end
  end

  def edit
  end


  def update
    @novel.update_attributes(novel_params)
    if @novel.save
      flash[:success] = "更新しました"
      redirect_to @novel
    else
      render "edit"
    end
  end

  def destroy
    @novel.destroy
    flash[:success] = "小説を削除しました"
    redirect_to current_user
  end

  def ranking
    novel_ids = Bookmark.group(:novel_id).order('count(novel_id) desc').limit(10).pluck(:novel_id)
    @ranks = []
    cnt = 0
    novel_ids.each do |id|
      @ranks[cnt] = Novel.find(id)
      cnt += 1
    end
    @imranks =Story.find(Impression.group(:story_id).order('count(story_id) desc').limit(10).pluck(:story_id))
  end
  private

    def seach_params
      params.fetch(:search, {}).permit(:novel)
    end

    def set_novel
      @novel = Novel.find(params[:id])
    end

    def novel_params
      params.require(:novel).permit(:title, :description)
    end

    def correct_user
       @novel = right_user
       if @novel.nil?
        flash[:danger] = "別のユーザーの作品は変更出来ません"
        redirect_to current_user
      end
    end
end
