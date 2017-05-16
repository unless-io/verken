class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_explorations, class_name: "Exploration"
  has_many :explorations, through: :participants
  has_many :participants
  has_many :evaluations

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
