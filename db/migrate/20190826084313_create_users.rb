class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :password_digest
      t.text :introduction
      t.string :remember_digest
      t.integer :status,default: 1
      t.boolean :activated,default: false
      t.string :activation_digest
      t.datetime :activated_at
      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email, unique: true
    add_index :users, :status
  end
end
