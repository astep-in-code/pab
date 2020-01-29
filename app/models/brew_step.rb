class BrewStep < ApplicationRecord
  belongs_to :brew
  belongs_to :beer_step

  validates :status, presence: :true
end
