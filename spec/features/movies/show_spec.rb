require "rails_helper"

RSpec.describe "movie show page" do
  describe "Shows a movie and its attributes" do
    it " Shows a movie and its attributes and its actors from youngest to oldest, displays average age" do 
      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

      movie_1 = studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "Animation")
      actor_1 = movie_1.actors.create!(name: "Tom Cruize", age: 30)
      actor_2 = movie_1.actors.create!(name: "Keneau Reeves", age: 24)

      visit "/movies/#{movie_1.id}"

      expect(page).to have_content("Title: Toy Story")
      expect(page).to have_content("Creation Year: 1995")
      expect(page).to have_content("Genre: Animation")
      expect(page).to have_content("Actor: Tom Cruize")
      expect(page).to have_content("Age: 30")
      expect(page).to have_content("Actor: Keneau Reeves")
      expect(page).to have_content("Age: 24")
      expect(page).to have_content("Average Age: 27")
    end

    it "displays a form to add an existing actor to the specific movie" do
      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

      movie_1 = studio_1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "Animation")
      movie_2 = studio_1.movies.create!(title: "Snowpiercer", creation_year: "2015", genre: "Action")

      actor_1 = movie_1.actors.create!(name: "Tom Cruize", age: 30)
      actor_2 = movie_1.actors.create!(name: "Keneau Reeves", age: 24)
      actor_3 = Actor.create!(name: "Chris Pratt", age: 27)
  
      visit "/movies/#{movie_1.id}"
  
      fill_in :actor_id, with: actor_3.id
      click_button "Submit"
  
      expect(current_path).to eq("/movies/#{movie_1.id}")
  
      expect(page).to have_content("Actor: Chris Pratt")
      expect(page).to have_content("Age: 27")
    end
  end
end