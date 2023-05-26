# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      wb = Studio.create!(name: "Warner Brothers", location: "Burbank")
      ddarko = uni.movies.create!(title: "Donnie Darko", creation_year: "2000", genre: "Sci-Fi")
      tdrifter = uni.movies.create!(title: "Tokyo Drifter", creation_year: "1966", genre: "Action")
      eight = wb.movies.create!(title: "8 1/2", creation_year: "1963", genre: "Fantasy")
      jodirt = wb.movies.create!(title: "Joe Dirt", creation_year: "2000", genre: "Comedy")