require "rails_helper"

RSpec.describe "/studios, index page" do
  describe "as a user" do    
    let!(:studio1) {Studio.create!(name: "Universal Studios", location: "Hollywood")}
    let!(:movie1) {studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
    
    let!(:studio2) {Studio.create!(name: "Max Studios", location: "London")}
    let!(:movie2) {studio2.movies.create!(title: "The Land of Things", creation_year: "2054", genre: "stop motion")}
    let!(:movie3) {studio2.movies.create!(title: "History of Things", creation_year: "2000", genre: "live action")}
    

    it "i see the studio name and location" do
      visit "/studios"
      
      expect(page).to have_content("All Studios")
      # save_and_open_page

      within "#studio-#{studio1.id}" do
        expect(page).to have_content(studio1.name)
        expect(page).to have_content("Location: #{studio1.location}")
        expect(page).to_not have_content(studio2.name)
        expect(page).to_not have_content("Location: #{studio2.location}")
      end

      within "#studio-#{studio2.id}" do
        expect(page).to have_content(studio2.name)
        expect(page).to have_content("Location: #{studio2.location}")
        expect(page).to_not have_content(studio1.name)
        expect(page).to_not have_content("Location: #{studio1.location}")
      end
    end

    it "see all movies & their attributes associated with each studio" do
      visit "/studios"
      # save_and_open_page
      within "#studio-#{studio1.id}" do
        expect(page).to have_content(studio1.name)
        expect(page).to have_content("Location: #{studio1.location}")
        expect(page).to have_content("All Movies")
        expect(page).to have_content("Title: #{movie1.title}")
        expect(page).to have_content("Creation Year: #{movie1.creation_year}")
        expect(page).to have_content("Genre: #{movie1.genre}")
        expect(page).to_not have_content("Title: #{movie2.title}")
        expect(page).to_not have_content("Title: #{movie3.title}")
      end

      within "#studio-#{studio2.id}" do
        expect(page).to have_content(studio2.name)
        expect(page).to have_content("Location: #{studio2.location}")
        expect(page).to have_content("All Movies")
        expect(page).to have_content("Title: #{movie2.title}")
        expect(page).to have_content("Creation Year: #{movie2.creation_year}")
        expect(page).to have_content("Genre: #{movie2.genre}")
        expect(page).to have_content("Title: #{movie3.title}")
        expect(page).to have_content("Creation Year: #{movie3.creation_year}")
        expect(page).to have_content("Genre: #{movie3.genre}")
        expect(page).to_not have_content("Title: #{movie1.title}")
      end
    end
  end
end