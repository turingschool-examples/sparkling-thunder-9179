require "rails_helper"

RSpec.describe "the studio show page" do
# Extension - Studio's Actors
  it "I see all of the studios including name and location, and under each studio I see all of the studio's movie attributes" do
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
    actor5 = movie2.actors.create!(name: "Acty Actorface", age: 34)
    actor6 = movie3.actors.create!(name: "Acting Actorson", age: 54)
    actor7 = movie4.actors.create!(name: "Actually McActor", age: 66)

    visit "/studios/#{studio1.id}"
save_and_open_page
    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)
    expect(page).to_not have_content(studio2.name)
    expect(page).to_not have_content(studio2.location)
    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
    expect(page).to have_content(actor4.name)
    expect(page).to have_content(actor5.name)
  end
end
