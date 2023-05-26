# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

MovieActor.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

studio_1 = Studio.create!(name: "Big Production", location: "New York")

movie_1 = studio_1.movies.create!(title: "Tootles!", creation_year: "1990", genre: "RomCom")

actor_1 = movie_1.actors.create!(name: "Buzz Boy", age: 55)
actor_2 = movie_1.actors.create!(name: "Lizzy McAlpine", age: 25)
actor_3 = movie_1.actors.create!(name: "Starlight Starbright", age: 130)

actor_4 = Actor.create!(name: "Florence Pugh", age: 27)