class Room < ApplicationRecord
  has_many_attached :images

  belongs_to :hotel

  validates :room_type, presence: true
  validates :price_per_night, presence: true
end
