class Hotel < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  # has_many :rooms, dependent: :destroy
end
