class Api::V1::UsersController < Api::V1::BaseController
  api :GET, "/v1/users", "List all users with pagination"
  param :page, :number, desc: "Page number for pagination"
  param :per_page, :number, desc: "Number of users per page"
  returns code: 200, desc: "Ok"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"

  def index
    pagy, users = pagy(User.all, items: params[:per_page] || 10)

    render json: {
      users:,
      meta:  pagy_metadata(pagy)
    }
  end

  api :GET, "/v1/users/:id", "Show a user with their favorite movies"
  param :id, :number, desc: "ID of the user"
  returns code: 200, desc: "Ok"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"

  def show
    user = User.find(params[:id])

    render json: user, include: :favorite_movies
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  api :GET, "/v1/users/:id/favorite_movies", "List all favorite movies of a user"
  param :id, :number, desc: "ID of the user"
  returns code: 200, desc: "Ok"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"

  def favorite_movies
    user = User.find(params[:id])
    favorite_movies = user.favorite_movies

    render json: favorite_movies
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
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
end
