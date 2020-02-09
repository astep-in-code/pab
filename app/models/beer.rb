class Beer < ApplicationRecord
  has_many_attached :photos

  has_many :brews, dependent: :destroy
  has_many :beer_sub_steps

  validates :name, presence: true
end
