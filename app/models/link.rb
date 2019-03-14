class Link < ApplicationRecord
  belongs_to :user
  validates :name, :url, presence: true, length: { minimum:3 }

end
