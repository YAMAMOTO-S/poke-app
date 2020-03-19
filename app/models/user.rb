class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :pokemons
  has_many :favorites

  has_many :favorite_pokemons, through: :favorites, source: :pokemon
  mount_uploader :image, ImageUploader

  has_many :comments
end
