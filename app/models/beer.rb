class Beer < ApplicationRecord
  has_many :brew, dependent: :destroy
end
