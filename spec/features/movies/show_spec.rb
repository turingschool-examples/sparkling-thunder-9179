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
    it "can list all actors from youngest to oldest" do
      visit "/movies/#{@movie_2.id}"
      
      expect(@actor_2.name).to appear_before(@actor_3.name)
      expect(@actor_3.name).to appear_before(@actor_1.name)
      expect(@actor_1.name).to_not appear_before(@actor_2.name)
    end
    
    it "can show the average age of all actors in a movie" do
      visit "/movies/#{@movie_4.id}"
      expect(page).to have_content("Average Age: 51")
      
      visit "/movies/#{@movie_3.id}"
      expect(page).to have_content("Average Age: 59")
    end
    
    it "does not show any actors that are not in a movie" do
      visit "/movies/#{@movie_4.id}"
      
      expect(page).to_not have_content(@actor_2.name)
      expect(page).to_not have_content(@actor_3.name)

      visit "/movies/#{@movie_3.id}"

      expect(page).to_not have_content(@actor_1.name)
      expect(page).to_not have_content(@actor_2.name)
      expect(page).to_not have_content(@actor_5.name)
    end
  end
end