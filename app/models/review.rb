class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true
  validates :user_name, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
