# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
studio2 = Studio.create!(name: "Disney", location: "Disneyland")
movie1 = studio1.movies.create!(title: "A Movie", creation_year: "2023", genre: "comedy")
movie2 = studio1.movies.create!(title: "B Movie", creation_year: "2013", genre: "horror")
movie3 = studio2.movies.create!(title: "C Movie", creation_year: "2022", genre: "animation")
movie4 = studio2.movies.create!(title: "D Movie", creation_year: "2012", genre: "family")
actor1 = movie1.actors.create!(name: "Sandra Bullock", age: 58)
actor2 = movie1.actors.create!(name: "Meryl Streep", age: 73)
actor3 = movie1.actors.create!(name: "Emma Watson", age: 33)
actor4 = movie2.actors.create!(name: "Person Actress", age: 40)
  