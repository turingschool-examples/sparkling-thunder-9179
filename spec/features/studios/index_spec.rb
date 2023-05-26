require "rails_helper"

RSpec.describe "studio index page" do
  describe "Shows all studios and their attributes" do
    it " Shows studios and their attributes and the studios movies" do 
      studio = Studio.create!(name: 'Universal Studios', location: "Hollywood")
      movie = studio.movies.create!(title: "Toy Story", creation_year: "1995", genre: "Animation")

      visit "/studios"

      expect(page).to have_content("Studio: Universal Studios")
      expect(page).to have_content("Location: Hollywood")
      expect(page).to have_content("Universal Studios Movies:")
      expect(page).to have_content("Title: Toy Story")
      expect(page).to have_content("Creation Year: 1995")
      expect(page).to have_content("Genre: Animation")
    end
  end
end