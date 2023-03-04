class Experience < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews, dependent: :destroy

end
