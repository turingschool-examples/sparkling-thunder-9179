require "rails_helper"

RSpec.describe "Studios", type: :feature do
  describe "Studio Index" do
    it "displays a list of all studios" do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    movie1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "Animation", studio: studio1)
    movie2 = Movie.create!(title: "The Godfather", creation_year: "1972", genre: "Crime", studio: studio1)
    visit "/studios"

    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)
  
    end
  end
end