# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
studio_1 = Studio.create!(name: "LucasArts", location: "LA")
    movie_1 = studio_1.movies.create!(title: "StarWars", creation_year: "1987", genre: "Scifi")
    actor_1 = movie_1.actors.create!(name: "Mark Hamil", age: 28)
    actor_2 = movie_1.actors.create!(name: "Harrison Ford", age: 34)
    actor_3 = movie_1.actors.create!(name: "Carrie Fisher", age: 28)