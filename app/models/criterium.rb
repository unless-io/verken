class Criterium < ApplicationRecord
  belongs_to :exploration
  has_many :evaluations
end
