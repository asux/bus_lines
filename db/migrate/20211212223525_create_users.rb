# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_digest
      t.integer :role, default: 0, index: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
