class Evaluation < ApplicationRecord
  belongs_to :item
  belongs_to :criterium
  belongs_to :user
end
