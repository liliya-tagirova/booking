class Hotel < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :stars, presence: true
  # has_many :rooms, dependent: :destroy
end
