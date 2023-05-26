require "rails_helper"

RSpec.describe "Studio Index Page" do
  it "should display all studios and their movies" do
    studio_1 = Studio.create!(name: "Disney", location: "Burbank, CA")
    studio_2 = Studio.create!(name: "Columbia", location: "Los Angeles, CA")

    movie_1 = studio_1.movies.create!(title: "The Lion King", creation_year: "1994", genre: "Childrens")
    movie_2 = studio_1.movies.create!(title: "Star Wars", creation_year: "1972", genre: "Science Fiction")
    movie_3 = studio_2.movies.create!(title: "The Karate Kid", creation_year: "1984", genre: "Action")
    movie_4 = studio_2.movies.create!(title: "American Psycho", creation_year: "2000", genre: "Horror")

    visit "/studios"

    within("#studio-#{studio_1.id}") do
      expect(page).to have_content(studio_1.name)
      expect(page).to have_content(studio_1.location)

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
      expect(page).to have_content(movie_1.genre)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_2.creation_year)
      expect(page).to have_content(movie_2.genre)

      expect(page).to_not have_content(studio_2.name)
      expect(page).to_not have_content(movie_3.title)
      expect(page).to_not have_content(movie_4.title)
    end

    within("#studio-#{studio_2.id}") do
      expect(page).to have_content(studio_2.name)
      expect(page).to have_content(studio_2.location)

      expect(page).to have_content(movie_3.title)
      expect(page).to have_content(movie_3.creation_year)
      expect(page).to have_content(movie_3.genre)
      expect(page).to have_content(movie_4.title)
      expect(page).to have_content(movie_4.creation_year)
      expect(page).to have_content(movie_4.genre)

      expect(page).to_not have_content(studio_1.name)
      expect(page).to_not have_content(movie_1.title)
      expect(page).to_not have_content(movie_2.title)
    end

  end
end