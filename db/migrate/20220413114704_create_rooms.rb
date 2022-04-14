# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.belongs_to :hotel, null: false, foreign_key: true
      t.string  :room_type
      t.string  :link_img
      t.integer :price_per_night
      t.string  :bed_type
      t.integer :number_of_people
      t.string  :comforts
      t.string  :booking_type
      t.string  :food

      t.timestamps
    end
  end
end
