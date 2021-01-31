class Room < ApplicationRecord
  has_many :room_users
  has_many :users, thtough: :room_users
end
