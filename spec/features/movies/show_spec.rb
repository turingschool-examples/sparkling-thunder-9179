require "rails_helper"

RSpec.describe "/movies/:id" do 
  describe "as a visitor" do 
    it "has the movies attributes" do 
      uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      wb = Studio.create!(name: "Warner Brothers", location: "Burbank")
      ddarko = uni.movies.create!(title: "Donnie Darko", creation_year: "2000", genre: "Sci-Fi")
      tdrifter = uni.movies.create!(title: "Tokyo Drifter", creation_year: "1966", genre: "Action")
      eight = wb.movies.create!(title: "8 1/2", creation_year: "1963", genre: "Fantasy")
      jodirt = wb.movies.create!(title: "Joe Dirt", creation_year: "2000", genre: "Comedy")

      visit "/movies/#{ddarko.id}"
      expect(page).to have_content(ddarko.title)
      expect(page).to have_content(ddarko.creation_year)
      expect(page).to have_content(ddarko.genre)

      visit "/movies/#{tdrifter.id}"
      expect(page).to have_content(tdrifter.title)
      expect(page).to have_content(tdrifter.creation_year)
      expect(page).to have_content(tdrifter.genre)

      visit "/movies/#{eight.id}"
      expect(page).to have_content(eight.title)
      expect(page).to have_content(eight.creation_year)
      expect(page).to have_content(eight.genre)

      visit "/movies/#{jodirt.id}"
      expect(page).to have_content(jodirt.title)
      expect(page).to have_content(jodirt.creation_year)
      expect(page).to have_content(jodirt.genre)
    end

    it "lists all actors from youngest to oldest" do 
      uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      ddarko = uni.movies.create!(title: "Donnie Darko", creation_year: "2000", genre: "Sci-Fi")
      jake = ddarko.actors.create!(name: "Jake Gyllenhaal", age: 42)   
      maggie = ddarko.actors.create!(name: "Maggie Gyllenhaal", age: 45)
      frank = ddarko.actors.create!(name: "Frank", age: 18)

      visit "/movies/#{ddarko.id}"

      expect(frank.name).to appear_before(jake.name)
      expect(jake.name).to appear_before(maggie.name)
      expect(maggie.name).to_not appear_before(frank.name)

      wb = Studio.create!(name: "Warner Brothers", location: "Burbank")
      jodirt = wb.movies.create!(title: "Joe Dirt", creation_year: "2000", genre: "Comedy")
      spade = jodirt.actors.create!(name: "David Spade", age: 46)  
      walken = jodirt.actors.create!(name: "Christopher Walken", age: 74)  

      visit "/movies/#{jodirt.id}"

      expect(spade.name).to appear_before(walken.name)
    end

    it "has average age of all movies actors" do 
      uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      ddarko = uni.movies.create!(title: "Donnie Darko", creation_year: "2000", genre: "Sci-Fi")
      jake = ddarko.actors.create!(name: "Jake Gyllenhaal", age: 42)   
      maggie = ddarko.actors.create!(name: "Maggie Gyllenhaal", age: 45)
      frank = ddarko.actors.create!(name: "Frank", age: 18)

      visit "/movies/#{ddarko.id}"

      expect(page).to have_content("Average Age of Actors: #{(jake.age + maggie.age + frank.age)/ddarko.actors.count}")

      wb = Studio.create!(name: "Warner Brothers", location: "Burbank")
      jodirt = wb.movies.create!(title: "Joe Dirt", creation_year: "2000", genre: "Comedy")
      spade = jodirt.actors.create!(name: "David Spade", age: 46)  
      walken = jodirt.actors.create!(name: "Christopher Walken", age: 74) 

      visit "/movies/#{jodirt.id}"

      expect(page).to have_content("Average Age of Actors: #{(spade.age + walken.age)/jodirt.actors.count}")
    end
  end
end