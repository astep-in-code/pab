class Ispindle < ApplicationRecord

  validates :temperature, presence: true
  validates :density, presence: true
end
