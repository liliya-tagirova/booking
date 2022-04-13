class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  
  validates :title, presence: true, length: {minimum: 2}
  validates :stars, presence: true
end
