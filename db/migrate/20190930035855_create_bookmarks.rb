class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :novel_id

      t.timestamps
    end
    add_index :bookmarks, :user_id
    add_index :bookmarks, :novel_id
    add_index :bookmarks, [:user_id, :novel_id], unique: true
  end
end
