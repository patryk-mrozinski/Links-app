class Link < ApplicationRecord
  acts_as_votable
  acts_as_commentable
  belongs_to :user

  validates :name, :url, presence: true, length: { minimum:3 }

end
