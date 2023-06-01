require "rails_helper"

# As a user,
# When I visit the studio index page,
# Then I see all of the studios including name and location,
# And under each studio I see all of the studio's movies
# including the movie's title, creation year, and genre

RSpec.describe "Studio index" do
  before(:each) do
    @studio_a = Studio.create!(name: "Studio A", location: "California")
    @studio_b = Studio.create!(name: "Studio B", location: "India")
    @studio_c = Studio.create!(name: "Studio C", location: "Canada")

    @movie_1 = @studio_a.movies.create!(title: "Life", creation_year: "1977", genre: "drama")
    @movie_2 = @studio_a.movies.create!(title: "Death", creation_year: "1987", genre: "comedy")
    @movie_3 = @studio_b.movies.create!(title: "Going to the Park", creation_year: "1922", genre: "horror")
    @movie_4 = @studio_c.movies.create!(title: "Bubbles", creation_year: "2012", genre: "romance")

    @studios = [@studio_a, @studio_b, @studio_c]
  end

  it "displays all studios with their information and movies" do

    visit "/studios"

    @studios.each do |studio|
      within "#studio_index_#{studio.id}" do
        expect(page).to have_content(studio.name)
        expect(page).to have_content(studio.location)
        studio.movies.each do |movie|
          expect(page).to have_content(movie.title)
          expect(page).to have_content(movie.creation_year)
          expect(page).to have_content(movie.genre)
        end
      end
    end
    save_and_open_page
  end
end
