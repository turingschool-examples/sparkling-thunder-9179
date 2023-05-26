require "rails_helper"

RSpec.describe "the studio index", type: :feature do
  before(:each) do
    @studio_1 = Studio.create!(name: "Miramax", location: "LA")
    @studio_2 = Studio.create!(name: "Disney", location: "Orlando")
    @studio_1.movies.create!(title: "Jaws", creation_year: 1980, genre: "horror")
    @studio_1.movies.create!(title: "Top Gun", creation_year: 1987, genre: "action")
  end
  # Story 1 - Studio Index

  # And under each studio I see all of the studio's movies
  # including the movie's title, creation year, and genre
  it "lists all the studios and their attributes" do

    visit "/studios"
    save_and_open_page
    
    expect(page).to have_content("Miramax")
    expect(page).to have_content("LA")
    expect(page).to have_content("Disney")
    expect(page).to have_content("Orlando")
  end

  it "lists all of the studios movies, including their attributes" do
    visit "/studios"

    expect(page).to have_content("Jaws")
    expect(page).to have_content(1980)
    expect(page).to have_content("horror")
    expect(page).to have_content("Top Gun")
    expect(page).to have_content(1987)
    expect(page).to have_content("action")
  end
end
