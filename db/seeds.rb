# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# seeds.rb

# Create movies
Movie.create([
  {
    title: "The Shawshank Redemption",
    duration: "2:22",
    description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
    genre: "Drama",
    ratings: 9.3,
    director: "Frank Darabont"
  },
  {
    title: "The Godfather",
    duration: "2:55",
    description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
    genre: "Crime",
    ratings: 9.2,
    director: "Francis Ford Coppola"
  },
  {
    title: "The Dark Knight",
    duration: "2:32",
    description: "When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.",
    genre: "Action",
    ratings: 9.0,
    director: "Christopher Nolan"
  },
  {
    title: "Inception",
    duration: "2:28",
    description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
    genre: "Sci-Fi",
    ratings: 8.8,
    director: "Christopher Nolan"
  },
  {
    title: "Pulp Fiction",
    duration: "2:34",
    description: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
    genre: "Crime",
    ratings: 8.9,
    director: "Quentin Tarantino"
  },
  {
    title: "Forrest Gump",
    duration: "2:22",
    description: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.",
    genre: "Drama",
    ratings: 8.8,
    director: "Robert Zemeckis"
  },
  {
    title: "The Matrix",
    duration: "2:16",
    description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
    genre: "Sci-Fi",
    ratings: 8.7,
    director: "Lana Wachowski, Lilly Wachowski"
  },
  {
    title: "The Lord of the Rings: The Return of the King",
    duration: "3:21",
    description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
    genre: "Fantasy",
    ratings: 8.9,
    director: "Peter Jackson"
  },
  {
    title: "Fight Club",
    duration: "2:19",
    description: "An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.",
    genre: "Drama",
    ratings: 8.8,
    director: "David Fincher"
  },
  {
    title: "The Dark Knight Rises",
    duration: "2:44",
    description: "Eight years after the Joker's reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.",
    genre: "Action",
    ratings: 8.4,
    director: "Christopher Nolan"
  },
  {
    title: "Goodfellas",
    duration: "2:26",
    description: "The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.",
    genre: "Crime",
    ratings: 8.7,
    director: "Martin Scorsese"
  },
  {
    title: "The Lord of the Rings: The Fellowship of the Ring",
    duration: "2:58",
    description: "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.",
    genre: "Fantasy",
    ratings: 8.8,
    director: "Peter Jackson"
  },
  {
    title: "The Shawshank Redemption",
    duration: "2:22",
    description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
    genre: "Drama",
    ratings: 9.3,
    director: "Frank Darabont"
  },
  {
    title: "Schindler's List",
    duration: "3:15",
    description: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
    genre: "Biography",
    ratings: 8.9,
    director: "Steven Spielberg"
  },
  {
    title: "The Godfather: Part II",
    duration: "3:22",
    description: "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
    genre: "Crime",
    ratings: 9.0,
    director: "Francis Ford Coppola"
  },
  {
    title: "The Lord of the Rings: The Two Towers",
    duration: "2:59",
    description: "While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.",
    genre: "Fantasy",
    ratings: 8.7,
    director: "Peter Jackson"
  },
  {
    title: "Se7en",
    duration: "2:07",
    description: "Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.",
    genre: "Crime",
    ratings: 8.6,
    director: "David Fincher"
  },
  {
    title: "Gladiator",
    duration: "2:35",
    description: "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.",
    genre: "Action",
    ratings: 8.5,
    director: "Ridley Scott"
  },
  {
    title: "The Silence of the Lambs",
    duration: "1:58",
    description: "A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.",
    genre: "Crime",
    ratings: 8.6,
    director: "Jonathan Demme"
  },
  {
    title: "Interstellar",
    duration: "2:49",
    description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    genre: "Sci-Fi",
    ratings: 8.6,
    director: "Christopher Nolan"
  }
])

