require "rails_helper"

RSpec.describe "Movie Show Page" do
  let!(:studio1) {Studio.create!(name: "Univeral Studios", location: "Hollywood")}
  
  let!(:matrix) {studio1.movies.create!(title: "The Matrix", creation_year: 1999, genre: "Action")}
  let!(:speed) {studio1.movies.create!(title: "Speed", creation_year: 1994, genre: "Action")}
  let!(:always) {studio1.movies.create!(title: "Always Be My Maybe", creation_year: 2019, genre: "Rom Com")}

  let!(:keanu) {Actor.create!(name: "Keanu Reeves", age: 58)}
  let!(:laurence) {Actor.create!(name: "Laurence Fishburne", age: 61)}
  let!(:carrie) {Actor.create!(name: "Carrie-Anne Moss", age: 55)}
  let!(:sandra) {Actor.create!(name: "Sandra Bullock", age: 58)}
  let!(:ali) {Actor.create!(name: "Ali Wong", age: 41)}



  # let!(:matrix_keanu) {MovieActor.create!(movie: "The Matrix", )}

  describe "US2 I see the movie's title, creation year, and genre," do
    it "I see a list of all its actors from youngest to oldest. And I see the average age of all of the movie's actors" do

      matrix.actors << [keanu,laurence,carrie]
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

      # within("#movie_actors-#{matrix.id}") do
        expect(page).to have_content(keanu.name)
        expect(page).to have_content(keanu.age)
        expect(page).to have_content(laurence.name)
        expect(page).to have_content(carrie.name)
        expect(page).to_not have_content(ali.name)
        expect(page).to_not have_content(sandra.name)
      #end

        expect(carrie.name).to appear_before(keanu.name)
        expect(keanu.name).to appear_before(laurence.name)

        expect(page).to have_content("Average Actor's Age: 58 years.")

      end
    end
  end