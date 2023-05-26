require "rails_helper"

RSpec.describe "Movies", type: :feature do
  describe "Movies Show" do
    it "displays the movies title, creation year, and genre" do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    movie1 = Movie.create!(title: "Toy Story", creation_year: "1995", genre: "Animation", studio: studio1)
    movie2 = Movie.create!(title: "The Godfather", creation_year: "1972", genre: "Crime", studio: studio1)
    actor1 = Actor.create!(name: "Tom Hanks", age: 65)
    actor2 = Actor.create!(name: "Tim Allen", age: 70)
    actor3 = Actor.create!(name: "Al Capone", age: 90)
    # movie1.actors << [actor1, actor2, actor3]
    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)

    expect(page).to have_content(actor3.name)
    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)

    actor_list = page.all(".actor-name")
    expect(actor_list[0]).to have_content(actor3.name)
    expect(actor_list[1]).to have_content(actor1.name)
    expect(actor_list[2]).to have_content(actor2.name)

    expect(page).to have_content("Average Age of Actors:")
    expect(page).to have_content("75") 
    end
  end
end
