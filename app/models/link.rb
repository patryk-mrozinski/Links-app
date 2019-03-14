class Link < ApplicationRecord
  acts_as_votable
  belongs_to :user

  validates :name, :url, presence: true, length: { minimum:3 }

end
