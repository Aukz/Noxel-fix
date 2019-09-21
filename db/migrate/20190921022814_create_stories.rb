class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.references :novel, null: false, foreign_key: true

      t.timestamps
    end
    add_index :stories, :title
  end
end
