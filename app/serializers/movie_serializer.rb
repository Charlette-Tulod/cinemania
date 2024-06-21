class MovieSerializer < ActiveModel::Serializer
  attributes :id, :description, :duration, :genre, :ratings, :director
end
