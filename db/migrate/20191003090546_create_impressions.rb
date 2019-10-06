class CreateImpressions < ActiveRecord::Migration[6.0]
  def change
    create_table :impressions do |t|
      t.text :content
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
    add_index :impressions, :user_id
    add_index :impressions, :story_id
  end
end
