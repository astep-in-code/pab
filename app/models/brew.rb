class Brew < ApplicationRecord
  belongs_to :beer
  belongs_to :user
#  belongs_to :ispindle
#  belongs_to :brew_step

  has_many :brew_steps, dependent: :destroy
end
