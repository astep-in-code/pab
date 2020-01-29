class Beer < ApplicationRecord
  has_one :brew, dependent: :destroy
end
