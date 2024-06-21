class Api::V1::MoviesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_movie, only: %i[show update destroy favorite unfavorite]

  api :GET, "/v1/movies", "List all movies"
  param :page, :number, desc: "Page number for pagination"
  param :per_page, :number, desc: "Number of movies per page"

  def index
    pagy, @movies = pagy(Movie.all, items: params[:per_page] || 10)
    render json: {
      movies: ActiveModelSerializers::SerializableResource.new(@movies,
                                                               each_serializer: MovieSerializer),
      meta:   pagy_metadata(pagy)
    }
  end

  api :GET, "/v1/movies/:id", "Show a movie"
  param :id, :number, desc: "ID of the movie"

  def show
    render json: @movie, serializer: MovieSerializer
  end

  api :POST, "/v1/movies", "Create a movie"
  param :movie, Hash, desc: "Movie attributes", required: true do
    param :title, String, desc: "Title of the movie", required: true
    param :description, String, desc: "Description of the movie", required: true
    param :duration, String, desc: "Duration of the movie", required: true
    param :genre, String, desc: "Genre of the movie", required: true
    param :ratings, :number, desc: "Ratings of the movie", required: true
    param :director, String, desc: "Director of the movie", required: true
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, serializer: MovieSerializer, status: :created,
             location: api_v1_movie_url(@movie)
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, "/v1/movies/:id", "Update a movie"
  param :id, :number, desc: "ID of the movie", required: true
  param :movie, Hash, desc: "Movie attributes", required: true do
    param :title, String, desc: "Title of the movie"
    param :description, String, desc: "Description of the movie"
    param :duration, String, desc: "Duration of the movie"
    param :genre, String, desc: "Genre of the movie"
    param :ratings, :number, desc: "Ratings of the movie"
    param :director, String, desc: "Director of the movie"
  end

  def update
    if @movie.update(movie_params)
      render json: @movie, serializer: MovieSerializer, status: :ok,
             location: api_v1_movie_url(@movie)
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/v1/movies/:id", "Delete a movie"
  param :id, :number, desc: "ID of the movie", required: true

  def destroy
    @movie.destroy!
    head :no_content
  end

  api :POST, "/v1/movies/:id/favorite", "Favorite a movie"
  param :id, :number, desc: "ID of the movie"

  def favorite
    if current_user.favorite_movies.include?(@movie)
      render json: { error: "Movie already favorited" }, status: :unprocessable_entity
    else
      current_user.favorite_movies << @movie
      render json: { message: "Movie favorited successfully" }, status: :ok
    end
  end

  api :DELETE, "/v1/movies/:id/unfavorite", "Unfavorite a movie"
  param :id, :number, desc: "ID of the movie"

  def unfavorite
    if current_user.favorite_movies.include?(@movie)
      begin
        current_user.favorite_movies.delete(@movie)
        render json: { message: "Movie unfavorited successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    else
      render json: { error: "Movie not favorited by the user" }, status: :unprocessable_entity
    end
  end

  private

  def pagy_metadata(pagy)
    {
      current_page: pagy.page,
      next_page:    pagy.next,
      prev_page:    pagy.prev,
      total_pages:  pagy.pages,
      total_count:  pagy.count
    }
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :duration, :description, :genre, :ratings, :director)
  end
end
