# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" , { name: "Lord of the Rings" ])
#   Character.create(name: "Luke", movie: movies.first)
MovieActor.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

  universal = Studio.create!(name: "Universal Studios", location: "Studio City, CA") 
  mgm = Studio.create!(name: "MGM", location: "Culver City, CA") 
  warner = Studio.create!(name: "Warner Bros", location: "Culver City, CA") 

  ace = warner.movies.create!(title: "Ace Ventura Pet Detective", creation_year: "1994", genre: "Comedy") 
  mp = universal.movies.create!(title: "Major Payne", creation_year: "1995", genre: "Comedy") 
  terminator = mgm.movies.create!(title: "The Terminator", creation_year: "1984", genre: "Sci-fi") 

  cox = Actor.create!(name: "Courteney Cox", age: 26) 
  dan = Actor.create!(name: "Dan Marino", age: 33) 
  jim = Actor.create!(name: "Jim Carrey", age: 25) 
  sean = Actor.create!(name: "Mary Sean Young", age: 30) 
  tone = Actor.create!(name: "Tone Loc", age: 35) 
  arn = Actor.create!(name: "Arnold Schwarzenegger", age: 35) 
  
  mov_act1 = MovieActor.create!(movie_id: ace.id, actor_id: jim.id ) 
  mov_act2 = MovieActor.create!(movie_id: ace.id, actor_id: cox.id ) 
  mov_act3 = MovieActor.create!(movie_id: ace.id, actor_id: dan.id ) 
  mov_act4 = MovieActor.create!(movie_id: ace.id, actor_id: sean.id ) 
  mov_act5 = MovieActor.create!(movie_id: ace.id, actor_id: tone.id ) 