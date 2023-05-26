require "rails_helper"

RSpec.describe "Movie Show Page /movies/:id", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit a movie's show page, I can see all of a movie's attributes" do
    it "can show a movie's title, creation year, and genre" do
      visit "/movies/#{@movie_2.id}"
      
      expect(page).to have_content("#{@movie_2.title}'s Show Page")
      expect(page).to have_content("Creation Year: #{@movie_2.creation_year}")
      expect(page).to have_content("Genre: #{@movie_2.genre}")
      expect(page).to_not have_content(@movie_3.title)
      
      visit "/movies/#{@movie_4.id}"
      
      expect(page).to have_content("#{@movie_4.title}'s Show Page")
      expect(page).to have_content("Creation Year: #{@movie_4.creation_year}")
      expect(page).to have_content("Genre: #{@movie_4.genre}")
      expect(page).to_not have_content(@movie_3.title)
    end
  end

  describe "Listing Actors on a movie show page" do
    xit "can list all actors from youngest to oldest" do

    end

    xit "can show the average age of all actors in a movie" do

    end
  end
end