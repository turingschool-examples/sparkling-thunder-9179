require "rails_helper"

RSpec.describe "/studios index page" do
  it "displays all of the studios, their attriubtes, and its movies and their attributes" do
    studio_1 = Studio.create!(name: "Big Production", location: "New York")
    studio_2 = Studio.create!(name: "Movie City", location: "Kansas")

    movie_1 = studio_1.movies.create!(title: "Funny Guy", creation_year: "1990", genre: "RomCom")
    movie_2 = studio_1.movies.create!(title: "Heartbreaker", creation_year: "2000", genre: "Drama")

    movie_3 = studio_2.movies.create!(title: "Can't Remember", creation_year: "2005", genre: "Comedy")
    movie_4 = studio_2.movies.create!(title: "Over this", creation_year: "2020", genre: "Sci-Fi")

    visit "/studios"

    within "#studio-#{studio_1.id}" do
      expect(page).to have_content("#{studio_1.name}")
      expect(page).to have_content("#{studio_1.location}")

      expect(page).to have_content("Title: #{movie_1.title}")
      expect(page).to have_content("Creation Year: #{movie_1.creation_year}")
      expect(page).to have_content("Genre: #{movie_1.genre}")

      expect(page).to have_content("Title: #{movie_2.title}")
      expect(page).to have_content("Creation Year: #{movie_2.creation_year}")
      expect(page).to have_content("Genre: #{movie_2.genre}")
    end

    within "#studio-#{studio_2.id}" do
      expect(page).to have_content("#{studio_2.name}")
      expect(page).to have_content("Location: #{studio_2.location}")

      expect(page).to have_content("Title: #{movie_3.title}")
      expect(page).to have_content("Creation Year: #{movie_3.creation_year}")
      expect(page).to have_content("Genre: #{movie_3.genre}")

      expect(page).to have_content("Title: #{movie_3.title}")
      expect(page).to have_content("Creation Year: #{movie_3.creation_year}")
      expect(page).to have_content("Genre: #{movie_3.genre}")
    end
  end
end