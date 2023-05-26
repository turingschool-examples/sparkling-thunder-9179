require "rails_helper"

RSpec.describe "/movies/:id, show page" do
  describe "as a user" do
    let!(:studio1) {Studio.create!(name: "Universal Studios", location: "Hollywood")}
    let!(:movie1) {studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
    
    let!(:studio2) {Studio.create!(name: "Max Studios", location: "London")}
    let!(:movie2) {studio2.movies.create!(title: "The Land of Things", creation_year: "2054", genre: "stop motion")}
    let!(:movie3) {studio2.movies.create!(title: "History of Things", creation_year: "2000", genre: "live action")}
    
    it "I see movie's attributes" do
      visit "movies/#{movie1.id}"
      save_and_open_page
      expect(page).to have_content(movie1.title)
      expect(page).to have_content("Creation Year: #{movie1.creation_year}")
      expect(page).to have_content("Genre: #{movie1.genre}")
      expect(page).to_not have_content(movie2.title)
      expect(page).to_not have_content(movie3.title)

      visit "movies/#{movie2.id}"

      expect(page).to have_content(movie2.title)
      expect(page).to have_content("Creation Year: #{movie2.creation_year}")
      expect(page).to have_content("Genre: #{movie2.genre}")
      expect(page).to_not have_content(movie3.title)
      expect(page).to_not have_content(movie1.title)
    end

    it "I see a list of all its actors from youngest to oldest" do

    end

    it "I see an average age of all this movie's actors" do

    end
  end
end