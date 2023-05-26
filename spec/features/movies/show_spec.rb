require "rails_helper"

RSpec.describe "/movies/:id, show page" do
  describe "as a user" do
    let!(:studio1) {Studio.create!(name: "Universal Studios", location: "Hollywood")}
    let!(:movie1) {studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
    
    let!(:studio2) {Studio.create!(name: "Max Studios", location: "London")}
    let!(:movie2) {studio2.movies.create!(title: "The Land of Things", creation_year: "2054", genre: "stop motion")}
    let!(:movie3) {studio2.movies.create!(title: "History of Things", creation_year: "2000", genre: "live action")}
    
    let!(:actor1) {Actor.create!(name: "Meryl Streep", age: 72)}
    let!(:actor2) {Actor.create!(name: "Betty White", age: 89)}
    let!(:actor3) {Actor.create!(name: "Major Tom", age: 27)}
    let!(:actor4) {Actor.create!(name: "Suzie Styles", age: 17)}

    let!(:actmov1) {ActorMovie.create!(actor_id: actor1.id, movie_id: movie1.id)}
    let!(:actmov2) {ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id)}

    let!(:actmov3) {ActorMovie.create!(actor_id: actor2.id, movie_id: movie2.id)}
    
    it "I see movie's attributes" do
      visit "movies/#{movie1.id}"
      # save_and_open_page
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

    it "I see a list of all its actors from youngest to oldest and do not see actors that are not part of this movie" do
      visit "movies/#{movie1.id}"
      # save_and_open_page
      expect(page).to have_content("All Actors")
      within "#movie-#{movie1.id}" do
        expect(actor3.name).to appear_before(actor1.name)
        expect(page).to_not have_content(actor2.name)
      end
    end

    it "I see an average age of all this movie's actors" do
      visit "movies/#{movie1.id}"

      # save_and_open_page

      expect(page).to have_content("Average Age of All Actors: #{movie1.average_actor_age}") 
    end

    it "see a form to add an existing actor to this movie" do
      visit "movies/#{movie1.id}"

      expect(page).to have_content("Add an Actor to this Movie")

      fill_in "Actor", with: "#{actor4.id}"
      click_button "Submit"

      # save_and_open_page
      expect(current_path).to eq("/movies/#{movie1.id}")

      within "#movie-#{movie1.id}" do
        expect(actor4.name).to appear_before(actor3.name)
        expect(actor3.name).to appear_before(actor1.name)
        expect(page).to_not have_content(actor2.name)
      end
    end
  end
end