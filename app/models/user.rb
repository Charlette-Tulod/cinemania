class User < ApplicationRecord
  has_secure_password
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  validates :email, presence: true
end
