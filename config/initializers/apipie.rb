Apipie.configure do |config|
  config.app_name                = "Cinemania"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info["1.0"] = <<-DESC
    Welcome to Your API Documentation.
    This API provides access to user information and their respective movies.
    It supports CRUD operations for users and movies. User has already the JWT.
  DESC
end
