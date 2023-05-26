require "rails_helper"

RSpec.describe "/studios" do
  describe "As a visitor" do
    describe "When I visit the studios index page" do
      # Story 1 - Studio Index

      # As a user,
      # When I visit the studio index page,
      # Then I see all of the studios including name and location,
      # And under each studio I see all of the studio's movies
      # including the movie's title, creation year, and genre
      it "displays all the studios names and locations" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
        studio_2 = Studio.create!(name: "Janbarra Studios", location: "Somewhere Else")

        visit "/studios"

        expect(page).to have_content("Studio Name: #{studio_1.name}")
        expect(page).to have_content("Studio Location: #{studio_1.location}")

        expect(page).to have_content("Studio Name: #{studio_2.name}")
        expect(page).to have_content("Studio Location: #{studio_2.location}")

      end

      it "under each studio i see all the studios movies" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
        studio_2 = Studio.create!(name: "Janbarra Studios", location: "Somewhere Else")

        movie_1 = studio_1.movies.create!(title: "Wayne's World", creation_year: "1992", genre: "Amazing")
        movie_2 = studio_1.movies.create!(title: "Bill and Ted's Excellent Adventure", creation_year: "2000", genre: "Action")
        movie_3 = studio_2.movies.create!(title: "Passion of the Christ", creation_year: "1", genre: "Horror")

        visit "/studios"

        within "stu-move-#{studio_1.id}" do
          expect(page).to have_content("Movie Title: #{movie_1.name}")
          expect(page).to have_content("Year Created: #{movie_1.creation_year}")
          expect(page).to have_content("Genre: #{movie_1.creation_year}")

          expect(page).to have_content("Movie Title: #{movie_2.name}")
          expect(page).to have_content("Year Created: #{movie_2.creation_year}")
          expect(page).to have_content("Genre: #{movie_2.creation_year}")
        end

        within "stu-move-#{studio_2.id}" do
          expect(page).to have_content("Movie Title: #{movie_3.name}")
          expect(page).to have_content("Year Created: #{movie_3.creation_year}")
          expect(page).to have_content("Genre: #{movie_3.creation_year}")
        end
      end
    end
  end

end