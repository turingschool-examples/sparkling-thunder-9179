require "rails_helper"

RSpec.describe "the movie show page" do
# Story 2 - Movie Show
  it "I see the movie attributes and a list of all its actors sorted youngest to oldest with the average age" do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    movie1 = studio1.movies.create!(title: "A Movie", creation_year: "2023", genre: "comedy")
    movie2 = studio1.movies.create!(title: "B Movie", creation_year: "2013", genre: "horror")
    actor1 = movie1.actors.create!(name: "Sandra Bullock", age: 58)
    actor2 = movie1.actors.create!(name: "Meryl Streep", age: 73)
    actor3 = movie1.actors.create!(name: "Emma Watson", age: 33)
    actor4 = movie2.actors.create!(name: "Person Actress", age: 40)
    
    visit "/movies/#{movie1.id}"

    expect(page).to have_content("Movie Title: #{movie1.title}")
    expect(page).to have_content("Creation Year: #{movie1.creation_year}")
    expect(page).to have_content("Genre: #{movie1.genre}")
    expect(actor3.name).to appear_before(actor1.name)
    expect(actor1.name).to appear_before(actor2.name)
    expect(page).to have_content("Average Age of Actors: 54.67")
    expect(page).to_not have_content(movie2.title)
    expect(page).to_not have_content(actor4.name)
  end
end
