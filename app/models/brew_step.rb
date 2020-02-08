class BrewStep < ApplicationRecord
  belongs_to :brew
  has_many :beer_steps
  has_many :beer_sub_steps, through: :beer_steps
  has_many :ispindle, through: :brews

  validates :status, presence: true
end
