require "rails_helper"

RSpec.describe "Studio Show page" do
  let!(:studio) { Studio.create!(name: "Universal Studios", location: "Hollywood")}
  let!(:studio2) { Studio.create!(name: "Fox Studios", location: "Los Angeles")}

  let!(:movie1) { studio.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
  let!(:movie3) { studio.movies.create!(title: "Toy Story 2", creation_year: "1998", genre: "animation")}

  let!(:movie2) { studio2.movies.create!(title: "Scream", creation_year: "2002", genre: "horror comedy")}

  let!(:actor1) { movie1.actors.create!(name: "Tim Allen", age: 58)}
  let!(:actor1) { movie3.actors.create!(name: "Tim Allen", age: 58)}

  let!(:actor2) { movie1.actors.create!(name: "Jim Varney", age: 65)}
  let!(:actor2) { movie3.actors.create!(name: "Jim Varney", age: 65)}

  let!(:actor3) { movie1.actors.create!(name: "Tom Hanks", age: 55)}

  let!(:actor4) { movie3.actors.create!(name: "Joan Cusack", age: 60)}


  let!(:actor5) { movie2.actors.create!(name: "David Arquette", age: 31)}
  let!(:actor6) { movie2.actors.create!(name: "Drew Berrymore", age: 29)}


  describe "/studios/:id" do
    it "should display studio name and location" do
      visit "/studios/#{studio.id}"

      expect(page).to have_content(studio.name)
      expect(page).to have_content(studio.location)

    end

    it "should display a unique list of all the actors that worked with the studio" do
      visit "/studios/#{studio.id}"

      expect(page).to have_content(actor1.name)
      expect(page).to have_content(actor2.name)
      expect(page).to have_content(actor3.name)
      expect(page).to have_content(actor4.name)

    end
  end
end