class Beer < ApplicationRecord
  has_many_attached :photos

  has_many :brew, dependent: :destroy
  validates :name, presence: true
end
