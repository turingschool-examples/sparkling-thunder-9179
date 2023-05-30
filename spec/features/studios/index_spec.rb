require "rails_helper"

RSpec.describe "/studios", type: :feature do
  describe "index" do
    before(:each) do
      @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "Jurassic Park", creation_year: "1995", genre: "action")
      @movie_2 = @studio_1.movies.create!(title: "Oppenheimer", creation_year: "2023", genre: "puzzle")

      @studio_2 = Studio.create!(name: "Pixar", location: "Brea")
      @movie_3 = @studio_2.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
      @movie_4 = @studio_2.movies.create!(title: "Inside Out", creation_year: "2015", genre: "animation")
    end

    it "displays all studios with information includio all movies and their information" do
      visit "/studios"

      within "#studio-#{@studio_1.id}" do
        expect(page).to have_content("Studio Name: #{@studio_1.name}")
        expect(page).to have_content("Studio Location: #{@studio_1.location}")
        expect(page).to have_content("Movie Title: #{@movie_1.title}")
        expect(page).to have_content("Creation Year: #{@movie_1.creation_year}")
        expect(page).to have_content("Genre: #{@movie_1.genre}")
        expect(page).to have_content("Movie Title: #{@movie_2.title}")
        expect(page).to have_content("Creation Year: #{@movie_2.creation_year}")
        expect(page).to have_content("Genre: #{@movie_2.genre}")
      end

      within "#studio-#{@studio_2.id}" do
        expect(page).to have_content("Studio Name: #{@studio_2.name}")
        expect(page).to have_content("Studio Location: #{@studio_2.location}")
        expect(page).to have_content("Movie Title: #{@movie_3.title}")
        expect(page).to have_content("Creation Year: #{@movie_3.creation_year}")
        expect(page).to have_content("Genre: #{@movie_3.genre}")
        expect(page).to have_content("Movie Title: #{@movie_4.title}")
        expect(page).to have_content("Creation Year: #{@movie_4.creation_year}")
        expect(page).to have_content("Genre: #{@movie_4.genre}")
      end
    end
  end
end