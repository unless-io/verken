class Item < ApplicationRecord
  belongs_to :exploration
  has_many :links
  has_many :evaluations
end
