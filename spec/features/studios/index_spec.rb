require "rails_helper"

RSpec.describe "studio index page", type: :feature do
  before :each do
    test_data
  end

  describe "as a visitor" do
    describe "when I visit the studio index page" do
      it "I see a list of all of the studios and the names of all of its movies" do
        visit "/studios"

        expect(page).to have_content("Studios")

        within "#studio-#{@studio_1.id}" do
          expect(page).to have_content(@studio_1.name)
          expect(page).to have_content("Location: #{@studio_1.location}")
        end

        within "#movie-#{@movie_1.id}" do
          expect(page).to have_content(@movie_1.title)
          expect(page).to have_content(@movie_1.creation_year)
          expect(page).to have_content(@movie_1.genre)
        end

        within "#movie-#{@movie_2.id}" do
          expect(page).to have_content(@movie_2.title)
          expect(page).to have_content(@movie_2.creation_year)
          expect(page).to have_content(@movie_2.genre)
        end

        within "#studio-#{@studio_2.id}" do
          expect(page).to have_content(@studio_2.name)
          expect(page).to have_content("Location: #{@studio_2.location}")
        end

        within "#movie-#{@movie_3.id}" do
          expect(page).to have_content(@movie_3.title)
          expect(page).to have_content(@movie_3.creation_year)
          expect(page).to have_content(@movie_3.genre)
        end

        within "#movie-#{@movie_4.id}" do
          expect(page).to have_content(@movie_4.title)
          expect(page).to have_content(@movie_4.creation_year)
          expect(page).to have_content(@movie_4.genre)
        end
      end
    end
  end
end