class Tag < ApplicationRecord
  has_many :tageds
  has_many :links, through: :tageds

  def self.names_collection
    pluck(:name)
  end
end
