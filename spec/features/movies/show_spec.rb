require "rails_helper"

RSpec.describe "Movie Show" do
  let!(:studio1) { Studio.create!(name: "Warner Bros", location: "LA") }
  let!(:studio2) { Studio.create!(name: "MoviesINC", location: "DC") }

  let!(:movie1) { studio1.movies.create!(title: "Batman", creation_year: "2008", genre: "Action") }
  let!(:movie2) { studio2.movies.create!(title: "Spongebob", creation_year: "2022", genre: "Comedy") }

  let!(:actor1) { Actor.create!(name: "Tom Hanks", age: 60) }
  let!(:actor2) { Actor.create!(name: "Jim Carey", age: 55) }
  
  let!(:actor_movie1) { actor1.actor_movies.create!(actor: actor1, movie: movie2) }
  let!(:actor_movie2) { actor2.actor_movies.create!(actor: actor2, movie: movie2) }
  

  describe "Show specifc movies details (Story 2)" do
    it "should display the movie's title, creation year, and genre" do
      visit "/movies/#{movie2.id}"

      expect(page).to have_content("Movie")
      
      expect(page).to have_content(movie2.title)
      expect(page).to have_content(movie2.creation_year)
      expect(page).to have_content(movie2.genre)

      expect(page).to have_content("Actors")
      expect(page).to have_content("Tom Hanks")
      expect(page).to have_content("Jim Carey")

    end

    it "should display list of all its actors from youngest to oldest" do
      visit "/movies/#{movie2.id}"
      
    end
  end
end


# Story 2 - Movie Show

# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
# ```
