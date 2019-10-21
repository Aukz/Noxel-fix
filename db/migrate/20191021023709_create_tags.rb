class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :novel, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tags, :name
  end
end
