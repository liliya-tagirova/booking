class Room < ApplicationRecord
  belongs_to :hotel

  validates :room_type, presence: true
  validates :price_per_night, presence: true
end
