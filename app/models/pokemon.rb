class Pokemon < ApplicationRecord
  validates :order, presence: true
  validates :name, presence: true
  validates :image_url, presence: true

  belongs_to :user
  has_many :favorites


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
