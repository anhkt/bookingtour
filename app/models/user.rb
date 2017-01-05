class User < ApplicationRecord
  has_many :likes
  has_many :review
  has_many :rates
  has_many :comments
  has_many :bookings
  has_many :bank_cards
end
