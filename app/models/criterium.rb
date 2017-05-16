class Criterium < ApplicationRecord
  validates :question_type, inclusion: { in: %w(stars 1-10)}
  belongs_to :exploration
  has_many :evaluations
end
