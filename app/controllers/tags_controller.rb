class TagsController < ApplicationController

  def create
    @novel = Novel.find(params[:novel_id])
    @tag = @novel.tags.new(tag_params)
    if @novel.tags.count < 5
      @tag.save
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @novel = @tag.novel
    @tag.delete
  end

    private

def tag_params
  params.require(:tag).permit(:name)
end


end
