class Item < ApplicationRecord
  belongs_to :exploration
  has_many :links, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :criteria, through: :evaluations

  mount_uploader :photo, PhotoUploader
end
