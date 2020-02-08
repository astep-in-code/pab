class BeerSubStep < ApplicationRecord
  belongs_to :beer_step
  # belongs_to :brew_steps, through: :beer_steps
  belongs_to :beer
end
