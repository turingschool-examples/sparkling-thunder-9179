require "rails_helper"

RSpec.describe "Studio Show Page" do
  let!(:studio1) {Studio.create!(name: "Univeral Studios", location: "Hollywood")}
  let!(:studio2) {Studio.create!(name: "Warner Bros Studios", location: "Palm Springs")}
  let!(:studio3) {Studio.create!(name: "MGM Studios", location: "Orlando")}

  let!(:matrix) {studio1.movies.create!(title: "The Matrix", creation_year: 1999, genre: "Action")}
  let!(:speed) {studio1.movies.create!(title: "Speed", creation_year: 1994, genre: "Action")}
  let!(:always) {studio2.movies.create!(title: "Always Be My Maybe", creation_year: 2019, genre: "Rom Com")}
  let!(:bill) {studio2.movies.create!(title: "Bill & Ted's Excellent Adventure", creation_year: 1990, genre: "comedy")}
  let!(:point) {studio2.movies.create!(title: "Point Break", creation_year: 1991, genre: "Action")}
  let!(:john) {studio3.movies.create!(title: "John Wick", creation_year: 2014, genre: "Thriller")}

  let!(:keanu) {Actor.create!(name: "Keanu Reeves", age: 58)}
  let!(:laurence) {Actor.create!(name: "Laurence Fishburne", age: 61)}
  let!(:carrie) {Actor.create!(name: "Carrie-Anne Moss", age: 55)}
  let!(:sandra) {Actor.create!(name: "Sandra Bullock", age: 58)}
  let!(:ali) {Actor.create!(name: "Ali Wong", age: 41)}
  let!(:patrick) {Actor.create!(name: "Patrick Swayze", age: 50)}


  describe "EXT1 Studio's Actors" do
    it "I see a unique list of all of the actors that have worked on any of this studio's movies." do
      matrix.actors << [keanu, laurence, carrie]
      speed.actors << [keanu, sandra]
      always.actors << [keanu, ali]
      point.actors << [keanu, patrick]
      visit "/studios/#{studio1.id}"
save_and_open_page
      within("#studio-info-") do
        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.location)
      end

      within("#actor-info-") do
      expect(page).to have_content(keanu.name)
      expect(page).to have_content(sandra.name)
      expect(page).to have_content(carrie.name)
      expect(page).to_not have_content(patrick.name)
      expect(page).to_not have_content(ali.name)
        end
      end
    end
  end