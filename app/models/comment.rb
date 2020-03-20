class Comment < ApplicationRecord

  belongs_to :pokemon
  belongs_to :user

  has_many :goods
  
end
