class Review < ApplicationRecord
  belongs_to :experience
  belongs_to :booking
end
