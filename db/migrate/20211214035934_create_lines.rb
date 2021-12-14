# frozen_string_literal: true

class CreateLines < ActiveRecord::Migration[6.1]
  def change
    create_table :lines do |t|
      t.references :departure_location, foreign_key:  { to_table: :locations }
      t.references :arrival_location, foreign_key: { to_table: :locations }
      t.integer :capacity
      t.datetime :departure_at
      t.integer :duration
      t.monetize :price
      t.integer :tickets_count

      t.timestamps
    end
    add_index :lines, %i[departure_location_id arrival_location_id departure_at],
              unique: true,
              name: 'index_lines_on_departure_and_arrival_and_departure_at'
  end
end
