class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, index: true
      t.string :password_digest
      t.integer :role, default: 0, index: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
