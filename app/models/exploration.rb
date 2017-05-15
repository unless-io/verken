class Exploration < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :participants
  has_many :users, through: :participants
  has_many :criteria
  has_many :items
end
