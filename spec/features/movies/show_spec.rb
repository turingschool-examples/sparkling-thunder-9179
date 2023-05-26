require "rails_helper"

RSpec.describe "Movie Show Page" do
  let!(:studio1) {Studio.create!(name: "Univeral Studios", location: "Hollywood")}
  let!(:studio2) {Studio.create!(name: "Warner Bros Studios", location: "Palm Springs")}
  let!(:studio3) {Studio.create!(name: "MGM Studios", location: "Orlando")}


  let!(:matrix) {studio1.movies.create!(title: "The Matrix", creation_year: 1999, genre: "Action")}
  let!(:speed) {studio1.movies.create!(title: "Speed", creation_year: 1994, genre: "Action")}
  let!(:always) {studio1.movies.create!(title: "Always Be My Maybe", creation_year: 2019, genre: "Rom Com")}
  let!(:bill) {studio2.movies.create!(title: "Bill & Ted's Excellent Adventure", creation_year: 1990, genre: "comedy")}
  let!(:point) {studio2.movies.create!(title: "Point Break", creation_year: 1991, genre: "Action")}
  let!(:john) {studio3.movies.create!(title: "John Wick", creation_year: 2014, genre: "Thriller")}

  describe "US2 I see the movie's title, creation year, and genre," do
    it "I see a list of all its actors from youngest to oldest. And I see the average age of all of the movie's actors" do
      visit "/movies/#{matrix.id}"
      save_and_open_page

      within("h1") do
        expect(page).to have_content("Movie Show Page")
      end
      
      # within("#movie_info-#{matrix.id}") do
        expect(page).to have_content(matrix.title)
        expect(page).to have_content(matrix.genre)
        expect(page).to have_content(matrix.creation_year)
        
        expect(page).to_not have_content("Always Be My Maybe")
        expect(page).to_not have_content(2019)
        expect(page).to_not have_content("Rom Com")
        expect(page).to_not have_content("Point Break")
        #end
      end
    end
  end