# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
MovieActor.destroy_all

@studio_1 = Studio.create!(name: "Wolfie Productions", location: "Boulder, CO")
@studio_2 = Studio.create!(name: "Juno Films", location: "Denver, CO")

@movie_1 = @studio_1.movies.create!(title: "The dog chew", creation_year: "2022", genre: "Drama")
@movie_2 = @studio_1.movies.create!(title: "How to catch a squirrel", creation_year: "2023", genre: "Action")
@movie_3 = @studio_1.movies.create!(title: "What is that smell?", creation_year: "2021", genre: "Suspense")
@movie_4 = @studio_2.movies.create!(title: "Chew the World", creation_year: "2020", genre: "Adventure")
@movie_5 = @studio_2.movies.create!(title: "Gimme that squeak toy", creation_year: "2020", genre: "Thriller")
@movie_6 = @studio_2.movies.create!(title: "Can I have a cookie?", creation_year: "2022", genre: "Comedy")
@movie_7 = @studio_2.movies.create!(title: "Save the kid from the well", creation_year: "2018", genre: "Family")

@actor_1 = Actor.create!(age: 3, name: "Can Has Cheezburgr")                                          
@actor_2 = Actor.create!(age: 6, name: "Sir Wiggles")                                          
@actor_3 = Actor.create!(age: 2, name: "Inkjet Printer")                                          
@actor_4 = Actor.create!( age: 0, name: "Brutus")                                          
@actor_5 = Actor.create!(age: 5, name: "Mo")                                          
@actor_6 = Actor.create!(age: 7, name: "Bacon")                                          
@actor_7 = Actor.create!( age: 4, name: "Mrs. Doubtfire")                                          
@actor_8 = Actor.create!(age: 1, name: "Grandma")                                          
@actor_9 = Actor.create!(age: 2, name: "Bark Twain")                                          
@actor_10 = Actor.create!( age: 3, name: "Chew-barka")                                          
@actor_11 = Actor.create!( age: 0, name: "Mr. Mistoffelees")                                          
@actor_12 = Actor.create!(age: 27, name: "Wishbone")                                          
@actor_13 = Actor.create!(age: 5, name: "Sherlock")                                          
@actor_14 = Actor.create!(age: 3, name: "Sprinkles")                                          
@actor_15 = Actor.create!(age: 6, name: "Ladyfinger")                                          
@actor_16 = Actor.create!( age: 3, name: "Napoleon")                                          
@actor_17 = Actor.create!( age: 7, name: "Rumpelstiltskin")                                          
@actor_18 = Actor.create!(age: 2, name: "Rigatoni")

MovieActor.create!(movie: @movie_1, actor: @actor_1)
MovieActor.create!(movie: @movie_1, actor: @actor_2)
MovieActor.create!(movie: @movie_1, actor: @actor_4)
MovieActor.create!(movie: @movie_1, actor: @actor_5)
MovieActor.create!(movie: @movie_1, actor: @actor_6)

MovieActor.create!(movie: @movie_2, actor: @actor_6)
MovieActor.create!(movie: @movie_2, actor: @actor_7)

MovieActor.create!(movie: @movie_3, actor: @actor_3)
MovieActor.create!(movie: @movie_3, actor: @actor_10)
MovieActor.create!(movie: @movie_3, actor: @actor_8)
MovieActor.create!(movie: @movie_3, actor: @actor_9)

MovieActor.create!(movie: @movie_4, actor: @actor_11)
MovieActor.create!(movie: @movie_4, actor: @actor_12)
MovieActor.create!(movie: @movie_4, actor: @actor_13)

MovieActor.create!(movie: @movie_5, actor: @actor_14)
MovieActor.create!(movie: @movie_5, actor: @actor_15)
MovieActor.create!(movie: @movie_5, actor: @actor_16)
MovieActor.create!(movie: @movie_5, actor: @actor_17)
MovieActor.create!(movie: @movie_5, actor: @actor_18)
MovieActor.create!(movie: @movie_5, actor: @actor_3)

MovieActor.create!(movie: @movie_6, actor: @actor_16)

MovieActor.create!(movie: @movie_7, actor: @actor_3)
MovieActor.create!(movie: @movie_7, actor: @actor_4)
MovieActor.create!(movie: @movie_7, actor: @actor_16)