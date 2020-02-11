class BeerStep < ApplicationRecord
  # belongs_to :brew_step
  has_many :brew_steps
  has_many :beer_sub_steps
  # validates :sub_step, presence: true
  validates :step, presence: true
  validates :description, presence: :true
end
