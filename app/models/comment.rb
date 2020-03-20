class Comment < ApplicationRecord

  belongs_to :pokemon
  belongs_to :user

  has_many :goods
  has_many :bads
end
