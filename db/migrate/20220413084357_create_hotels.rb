# frozen_string_literal: true

class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :title
      t.integer :stars
      t.string :address
      t.float :rating
      t.text :about_hotel
      t.text :services
      t.text :extra
      t.text :contacts

      t.timestamps
    end
  end
end
