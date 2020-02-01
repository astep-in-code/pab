class BeerStep < ApplicationRecord
  has_many :brew_steps

  validates :sub_step, presence: :true
  validates :step, presence: :true
end
