class Beer < ApplicationRecord
  has_many :brew, dependent: :destroy
  has_many :beer_sub_steps

  validates :name, presence: true
end
