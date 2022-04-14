# frozen_string_literal: true

class Hotel < ApplicationRecord
  has_one_attached :avatar

  has_many :rooms, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
  validates :stars, presence: true
end
