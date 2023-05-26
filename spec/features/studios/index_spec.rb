require 'rails_helper'

RSpec.describe "/studios" do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Disney", location: "Florida")

    @movie_1 = @studio_1.movies.create!(title: "Speed", creation_year: "1996", genre: "Action")
    @movie_2 = @studio_1.movies.create!(title: "Matrix", creation_year: "1999", genre: "Scifi")
    @movie_3 = @studio_2.movies.create!(title: "Avengers", creation_year: "2006", genre: "Adventure")
    

  end
  describe 'As a user, when I visit the studio index page' do
    it 'displays all the studios including name and location' do
      visit '/studios'

      expect(page).to have_content("Studio Name: #{@studio_1.name}")
      expect(page).to have_content("Location: #{@studio_1.location}")
      expect(page).to have_content("Studio Name: #{@studio_2.name}")
      expect(page).to have_content("Location: #{@studio_1.location}")
    end

    it "also displays under each studio all the studio's movies including the movies title, creation year and genre" do
      visit '/studios'
      save_and_open_page
      within "#studio-#{@studio_1.id}" do
        expect(page).to have_content("Movie: #{@movie_1.title}")
        expect(page).to have_content("Year: #{@movie_1.creation_year}")
        expect(page).to have_content("Genre: #{@movie_1.genre}")
        expect(page).to have_content(@movie_2.title)
        expect(page).to have_content(@movie_2.creation_year)
        expect(page).to have_content(@movie_2.genre)

        expect(page).to_not have_content(@movie_3.title)
        expect(page).to_not have_content(@movie_3.creation_year)
        expect(page).to_not have_content(@movie_3.genre)
      end

      within "#studio-#{@studio_2.id}" do
        expect(page).to have_content("Movie: #{@movie_3.title}")
        expect(page).to have_content("Year: #{@movie_3.creation_year}")
        expect(page).to have_content("Genre: #{@movie_3.genre}")
      end

    end
  end
end