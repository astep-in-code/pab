class Beer < ApplicationRecord
  has_many :brew, dependent: :destroy
  validates :name, presence: true
end
