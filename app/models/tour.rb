class Tour < ApplicationRecord
   belongs_to :category

  has_many :rates
  has_many :bookings
  has_many :tour_places
end
