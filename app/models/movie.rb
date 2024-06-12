class Movie < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :duration, presence: true, format: { with: /\A\d+:\d+\z/, message: "Duration must be in 'hh:mm' format" }
    validates :description, presence: true, length: { maximum: 1000, message: "Description must be less than 1000 characters" }
    validates :genre, presence: true, length: { minimum: 1 }
    validates :ratings, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10, message: "Ratings must be between 0 and 10" }
    validates :director, presence: true, length: { maximum: 50 }
  end
  