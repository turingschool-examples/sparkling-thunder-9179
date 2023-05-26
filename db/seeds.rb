# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


@studio1 = Studio.create!(name: "Mountain Max", location: "Colorado")
@studio2 = Studio.create!(name: "Ocean Max", location: "California")
@movie1 = @studio1.movies.create!(title: "Going Hiking", creation_year: "1900", genre: "outdoor")
@movie2 = @studio1.movies.create!(title: "Wanda Goes Barking", creation_year: "2023", genre: "puppies")
@movie3 = @studio2.movies.create!(title: "Wanda VS The Vacuum", creation_year: "2022", genre: "super hero")
@movie4 = @studio2.movies.create!(title: "Driving I70", creation_year: "2000", genre: "action")
@actor1 = @movie3.actors.create!(name: "Tom Cruise", age: 75)
@actor2 = @movie3.actors.create!(name: "Wanda", age: 6)
