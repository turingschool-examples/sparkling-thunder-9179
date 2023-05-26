require "rails_helper"

RSpec.describe 'Movies Show Page', type: :features do
  let!(:universal) { Studio.create!(name: "Universal Studios", location: "Studio City, CA") }
  let!(:mgm) { Studio.create!(name: "MGM", location: "Culver City, CA") }
  let!(:warner) { Studio.create!(name: "Warner Bros", location: "Culver City, CA") }

  let!(:ace) { warner.movies.create!(title: "Ace Ventura Pet Detective", creation_year: "1994", genre: "Comedy") }
  let!(:mp) { universal.movies.create!(title: "Major Payne", creation_year: "1995", genre: "Comedy") }
  let!(:terminator) { mgm.movies.create!(title: "The Terminator", creation_year: "1984", genre: "Sci-fi") }

  let!(:cox) { Actor.create!(name: "Courteney Cox", age: 26) }
  let!(:dan) { Actor.create!(name: "Dan Marino", age: 33) }
  let!(:jim) { Actor.create!(name: "Jim Carrey", age: 25) }
  let!(:sean) { Actor.create!(name: "Mary Sean Young", age: 30) }
  let!(:tone) { Actor.create!(name: "Tone Loc", age: 35) }

  describe 'Displays movies attributes' do
    it 'Should display movie title, creation year, and genre' do
      visit "/movies/#{ace.id}"

      expect(page).to have_content(ace.title)
      expect(page).to have_content(ace.creation_year)
      expect(page).to have_content(ace.genre)
    end

    it 'Should display the actors assocaited with this movie ordered by age: youngest to oldest' do
      ace.actors << [jim, cox, dan, sean, tone]

      visit "/movies/#{ace.id}"
      
      expect(jim.name).to appear_before(cox.name)
      expect(cox.name).to appear_before(sean.name)
      expect(sean.name).to appear_before(dan.name)
      expect(dan.name).to appear_before(tone.name)
    end

    it "Should display the average age" do
      ace.actors << [jim, cox, dan, sean, tone]

      visit "/movies/#{ace.id}"

      expect(page).to have_content("Average Age: 30")
    end
  end
end
