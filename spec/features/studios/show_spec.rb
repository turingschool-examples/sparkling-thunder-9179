require "rails_helper"

RSpec.describe 'Studios Show Page', type: :features do
  let!(:universal) { Studio.create!(name: "Universal Studios", location: "Studio City, CA") }
  let!(:mgm) { Studio.create!(name: "MGM", location: "Culver City, CA") }
  let!(:warner) { Studio.create!(name: "Warner Bros", location: "Culver City, CA") }

  let!(:ace) { warner.movies.create!(title: "Ace Ventura Pet Detective", creation_year: "1994", genre: "comedy") }
  let!(:mask) { warner.movies.create!(title: "The Mask", creation_year: "1994", genre: "comedy") }
  let!(:mp) { universal.movies.create!(title: "Major Payne", creation_year: "1995", genre: "comedy") }
  let!(:terminator) { mgm.movies.create!(title: "The Terminator", creation_year: "1984", genre: "Sci-fi") }

  let!(:cox) { Actor.create!(name: "Courteney Cox", age: 26) }
  let!(:dan) { Actor.create!(name: "Dan Marino", age: 33) }
  let!(:jim) { Actor.create!(name: "Jim Carrey", age: 25) }
  let!(:sean) { Actor.create!(name: "Mary Sean Young", age: 30) }
  let!(:tone) { Actor.create!(name: "Tone Loc", age: 35) }
  let!(:arn) { Actor.create!(name: "Arnold Schwarzenegger", age: 35) }
  let!(:cam) { Actor.create!(name: "Cameron Diaz", age: 35) }

  let!(:mov_act1) { MovieActor.create!( actor_id: cam.id, movie_id: mask.id)}
  let!(:mov_act2) { MovieActor.create!( actor_id: jim.id, movie_id: mask.id)}

  describe 'Displays studios attributes' do
    it 'Should display studios name and location' do
      visit "/studios/#{warner.id}"

      expect(page).to have_content(warner.name)
      expect(page).to have_content(warner.location)
    end

    it 'Should display only unique names of actors in films from this studio' do
      ace.actors << [jim, cox, dan, sean, tone]

      visit "/studios/#{warner.id}"

      expect(page).to have_content(jim.name)
      expect(page).to have_content(cam.name)
      expect(page).to have_content(cox.name)
      expect(page).to have_content(dan.name)
      expect(page).to have_content(sean.name)
      expect(page).to have_content(tone.name)
    end
  end
end