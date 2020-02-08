class Ispindle < ApplicationRecord
  # belongs_to :brew
  # belongs_to :brew_steps, :through => :brews

  validates :temperature, presence: true
  validates :density, presence: true
end
