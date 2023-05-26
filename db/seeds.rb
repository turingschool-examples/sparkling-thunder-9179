# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
movie1 = studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
    
studio2 = Studio.create!(name: "Max Studios", location: "London")
movie2 = studio2.movies.create!(title: "The Land of Things", creation_year: "2054", genre: "stop motion")
movie3 = studio2.movies.create!(title: "History of Things", creation_year: "2000", genre: "live action")

actor1 = Actor.create!(name: "Meryl Streep", age: 72)
actor2 = Actor.create!(name: "Betty White", age: 89)
actor3 = Actor.create!(name: "Major Tom", age: 27)
actor4 = Actor.create!(name: "Suzie Styles", age: 17)

actmov1 = ActorMovie.create!(actor_id: actor1.id, movie_id: movie1.id)
actmov2 = ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id)

actmov3 = ActorMovie.create!(actor_id: actor2.id, movie_id: movie2.id)
