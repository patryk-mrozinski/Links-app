class Link < ApplicationRecord
  acts_as_votable
  acts_as_commentable
  belongs_to :user
  validates :name, :url, presence: true, length: { minimum:3 }

  size = {
    :large => [400, 400],
    :medium => [200, 200],
    :small => [50, 50]
  }

  mount_uploader :image, ImageUploader

  def own_by_user?(some_user)
    user == some_user
  end

end
