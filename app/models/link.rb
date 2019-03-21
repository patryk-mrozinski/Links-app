class Link < ApplicationRecord
  acts_as_votable
  acts_as_commentable
  belongs_to :user
  has_many :tageds
  has_many :tags, through: :tageds
  validates :name, :url, presence: true, length: { minimum:3 }

  mount_uploader :image, ImageUploader

  def self.tagged_with(name)
    Tag.find_by!(name: name).links
  end

  def tag_name=(names)
    self.tags = transfer_names_into_tags(names)
  end

  def tag_name
    tags.pluck(:name).join", "
  end

  def selected_tags
    tags.pluck(:name)
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

  def own_by_user?(some_user)
    user == some_user
  end

  private

  def transfer_names_into_tags(names)
    names.map { |name| Tag.find_or_create_by(name: name) }
  end

end
