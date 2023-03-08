class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :user
  has_one :review, as: :reviewable
end
