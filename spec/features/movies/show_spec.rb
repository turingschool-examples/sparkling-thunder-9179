require 'rails_helper'

RSpec.describe "/movies/:id" do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Disney", location: "Florida")

    @movie_1 = @studio_1.movies.create!(title: "Speed", creation_year: "1996", genre: "Action")
    @movie_2 = @studio_1.movies.create!(title: "Matrix", creation_year: "1999", genre: "Scifi")
    @movie_3 = @studio_2.movies.create!(title: "Avengers", creation_year: "2006", genre: "Adventure")

    @actor_1 = Actor.create!(name:"Keanu Reeves", age: 38)
    @actor_2 = Actor.create!(name: "Sandra Bullock", age: 22)
    @actor_3 = Actor.create!(name: "Chris Evans", age: 32)
    

  end
  describe "As a user, when I visit a movie's show page" do
    it 'displays the movies title, creation year and genre' do
      visit "/movies/#{@movie_1.id}"
      expect(page).to have_content("Title: #{@movie_1.title}")
      expect(page).to have_content("Creation Year: #{@movie_1.creation_year}")
      expect(page).to have_content("Genre: #{@movie_1.genre}")
      expect(page).to_not have_content("Title: #{@movie_2.title}")
      expect(page).to_not have_content("Creation Year: #{@movie_2.creation_year}")
      expect(page).to_not have_content("Genre: #{@movie_2.genre}")

      visit "/movies/#{@movie_2.id}"

      expect(page).to have_content("Title: #{@movie_2.title}")
      expect(page).to have_content("Creation Year: #{@movie_2.creation_year}")
      expect(page).to have_content("Genre: #{@movie_2.genre}")
      expect(page).to_not have_content("Title: #{@movie_3.title}")
      expect(page).to_not have_content("Creation Year: #{@movie_3.creation_year}")
      expect(page).to_not have_content("Genre: #{@movie_3.genre}")

    end
    it 'display a list of all its actors from youngest to oldest' do
      visit "/movies/#{@movie_1.id}"
      
    end
  end
end