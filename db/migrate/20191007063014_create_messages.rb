class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
    # add_index :messages, :room_id
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end
end
