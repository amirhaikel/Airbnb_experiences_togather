class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def review_present?
    review.present?
  end
end
