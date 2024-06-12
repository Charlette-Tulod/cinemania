json.extract! movie, :id, :title, :duration, :description, :genre, :ratings, :director, :created_at, :updated_at
json.url movie_url(movie, format: :json)
