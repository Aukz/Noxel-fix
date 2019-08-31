module ApplicationHelper
# 念のために書いておくタイトル用のメソッド
  def full_title(page_title = '')
    base_title = "Noxel"
    if page_title.empty?
      base_title
    else
      page_title
    end
  end
end
