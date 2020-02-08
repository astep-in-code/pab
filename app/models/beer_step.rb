class BeerStep < ApplicationRecord
  # belongs_to :brew_step

  # validates :sub_step, presence: true
  validates :step, presence: true
end
