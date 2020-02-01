class Beer < ApplicationRecord
  has_one :brew, dependent: :destroy

  validates :name, presence: true
end
