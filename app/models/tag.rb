class Tag < ApplicationRecord
  has_many :tageds
  has_many :links, through: :tageds
end
