class Brew < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  has_many :ispindles

  has_many :brew_steps, dependent: :destroy
end
