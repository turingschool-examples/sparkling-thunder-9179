# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all
Studio.destroy_all

@studio_1 = Studio.create!(name: "Wolfie Productions", location: "Boulder, CO")
@studio_2 = Studio.create!(name: "Juno Films", location: "Denver, CO")

@movie_1 = @studio_1.movies.create!(title: "The dog chew", creation_year: "2022", genre: "Drama")
@movie_2 = @studio_1.movies.create!(title: "How to catch a squirrel", creation_year: "2023", genre: "Action")
@movie_3 = @studio_1.movies.create!(title: "What is that smell?", creation_year: "2021", genre: "Suspense")
@movie_4 = @studio_2.movies.create!(title: "Chew the World", creation_year: "2020", genre: "Adventure")
@movie_5 = @studio_2.movies.create!(title: "Gimme that squeak toy", creation_year: "2020", genre: "Thriller")
@movie_6 = @studio_2.movies.create!(title: "Can I have a cookie?", creation_year: "2022", genre: "Comedy")
@movie_7 = @studio_2.movies.create!(title: "Save the kid from the well", creation_year: "2018", genre: "Family")