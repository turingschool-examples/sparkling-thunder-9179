require "rails_helper"

RSpec.describe "the Studio index page" do
  let!(:studio_1) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
  let!(:studio_2) { Studio.create!(name: "Disney", location: "Orlando") }

  let!(:movie_1) { studio_1.movies.create!(title: "Gremlins", creation_year: 1984, genre: "Horror") }
  let!(:movie_2) { studio_1.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action/Adventure") }
  let!(:movie_3) { studio_2.movies.create!(title: "Toy Story", creation_year: 1995, genre: "Animation") }
  let!(:movie_4) { studio_2.movies.create!(title: "Avatar", creation_year: 2009, genre: "Science Fiction") }

  before(:each) do
    visit "/studios"
  end

  it "should display all Studios and thier associated movies" do
    within("#studio-#{studio_1.id}") do
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Hollywood")

      within("#movie-#{movie_1.id}") do
        expect(page).to have_content("Gremlins")
        expect(page).to have_content("Year: 1984")
        expect(page).to have_content("Genre: Horror")
      end

      within("#movie-#{movie_2.id}") do
        expect(page).to have_content("Jurassic Park")
        expect(page).to have_content("Year: 1993")
        expect(page).to have_content("Genre: Action/Adventure")
      end
    end

    within("#studio-#{studio_2.id}") do
      expect(page).to have_content("Disney")
      expect(page).to have_content("Orlando")

      within("#movie-#{movie_3.id}") do
        expect(page).to have_content("Toy Story")
        expect(page).to have_content("Year: 1995")
        expect(page).to have_content("Genre: Animation")
      end

      within("#movie-#{movie_4.id}") do
        expect(page).to have_content("Avatar")
        expect(page).to have_content("Year: 2009")
        expect(page).to have_content("Genre: Science Fiction")
      end
    end
  end
end
