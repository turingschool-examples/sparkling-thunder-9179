require "rails_helper"

RSpec.describe "Studio Index" do
  let!(:studio1) {Studio.create!(name: "Univeral Studios", location: "Hollywood")}
  let!(:studio2) {Studio.create!(name: "Warner Bros Studios", location: "Palm Springs")}
  let!(:studio3) {Studio.create!(name: "MGM Studios", location: "Orlando")}


  let!(:matrix) {studio1.movies.create!(title: "The Matrix", creation_year: 1999, genre: "Action")}
  let!(:speed) {studio1.movies.create!(title: "Speed", creation_year: 1994, genre: "Action")}
  let!(:always) {studio1.movies.create!(title: "Always Be My Maybe", creation_year: 2019, genre: "Rom Com")}
  let!(:bill) {studio2.movies.create!(title: "Bill & Ted's Excellent Adventure", creation_year: 1990, genre: "comedy")}
  let!(:point) {studio2.movies.create!(title: "Point Break", creation_year: 1991, genre: "Action")}
  let!(:john) {studio3.movies.create!(title: "John Wick", creation_year: 2014, genre: "Thriller")}

  describe "US1 I visit the studio index page, Then I see all of the studios including name and location" do
    it "under each studio I see all of the studio's movies including the movie's title, creation year, and genre" do
      visit "/studios"

      expect(page).to have_content(studio1.name)
      expect(page).to have_content(studio1.location)
      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)
      expect(page).to have_content(studio3.name)
      expect(page).to have_content(studio3.location)
      end
    end
  end