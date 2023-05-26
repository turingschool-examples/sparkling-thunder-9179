require "rails_helper"

RSpec.describe "Movie Show Page" do
  let!(:studio) { Studio.create!(name: "Universal Studios", location: "Hollywood")}
  let!(:studio2) { Studio.create!(name: "Fox Studios", location: "Los Angeles")}

  let!(:movie1) { studio.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
  let!(:movie2) { studio2.movies.create!(title: "Scream", creation_year: "2002", genre: "horror comedy")}

  let!(:actor1) { movie1.actors.create!(name: "Tim Allen", age: 58)}
  let!(:actor2) { movie1.actors.create!(name: "Jim Varney", age: 65)}
  let!(:actor3) { movie1.actors.create!(name: "Tom Hanks", age: 55)}

  let!(:actor4) { Actor.create!(name: "John Morris", age: 15)}




  describe "/movies/:id" do
    it "should display the movie's title, creation year, and genre" do
      visit "/movies/#{movie1.id}"

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie1.creation_year)
      expect(page).to have_content(movie1.genre)
      expect(page).to_not have_content(movie2.title)
      expect(page).to_not have_content(movie2.creation_year)
      expect(page).to_not have_content(movie2.genre)
    end

    it "list of all actors from youngest to oldest" do
      visit "/movies/#{movie1.id}"

      expect(actor3.name).to appear_before(actor1.name)
      expect(actor1.name).to appear_before(actor2.name)
      expect(actor3.name).to appear_before(actor1.name)
    end

    it "should list average age of actors" do
      visit "/movies/#{movie1.id}"

      expect(page).to have_content("Average Age: 59")
    end

    it "should have a form to add an actor to this movie with actor ID" do
      visit "/movies/#{movie1.id}"

      expect(page).to_not have_content(actor4.name)
      expect(page).to have_button("Add Actor to #{movie1.title}")

      fill_in(:actor_id, with: "#{actor4.id}")
      click_button("Add Actor to #{movie1.title}")

      expect(current_path).to eq("/movies/#{movie1.id}")
      expect(page).to have_content(actor4.name)

    end
  end
end