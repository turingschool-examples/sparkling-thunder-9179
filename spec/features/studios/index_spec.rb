require "rails_helper"

RSpec.describe "/studios" do
  describe "As a visitor" do
    describe "When I visit the studios index page" do
      # Story 1 - Studio Index

      # As a user,
      # When I visit the studio index page,
      # Then I see all of the studios including name and location,
      # And under each studio I see all of the studio's movies
      # including the movie's title, creation year, and genre
      it "displays all the studios names and locations" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
        studio_2 = Studio.create!(name: "Janbarra Studios", location: "Somewhere Else")

        visit "/studios"

        expect(page).to have_content("Studio Name: #{studio_1.name}")
        expect(page).to have_content("Studio Location: #{studio_1.location}")
        
        expect(page).to have_content("Studio Name: #{studio_2.name}")
        expect(page).to have_content("Studio Location: #{studio_2.location}")

      end

      xit "under each studio i see all the studios movies attributes" do

      end
    end
  end

end