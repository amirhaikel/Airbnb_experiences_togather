class Experience < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
