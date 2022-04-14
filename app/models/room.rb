# frozen_string_literal: true

class Room < ApplicationRecord
  has_many_attached :images

  belongs_to :hotel
  belongs_to :user

  validates :room_type, presence: true
  validates :price_per_night, presence: true
end
