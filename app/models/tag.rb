class Tag < ApplicationRecord
  has_many :tageds, dependent: :destroy
  has_many :links, through: :tageds, dependent: :destroy

  def self.names_collection
    pluck(:name)
  end
end
