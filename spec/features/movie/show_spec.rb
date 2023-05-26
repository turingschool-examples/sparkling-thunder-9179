require "rails_helper"

RSpec.describe "the movie show page", type: :feature do
  let!(:studio_1) { Studio.create!(name: "Miramax", location: "LA") }
  let!(:movie_1) { studio_1.movies.create!(title: "Jaws", creation_year: 1980, genre: "horror") }
  let!(:actor_1) { Actor.create!(name: "Richard Dreyfulss", age: 32) }
  let!(:actor_2) { Actor.create!(name: "Roy Scheider", age: 35) }
  let!(:actor_3) { Actor.create!(name: "Jimmy Stewart", age: 55) }
  before(:each) do
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
  end

  it "lists a movie and its attributes" do
    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("Jaws")
    expect(page).to have_content(1980)
    expect(page).to have_content("horror")
  
    expect(page).to have_content("Roy Scheider")
    expect(page).to have_content("Richard Dreyfulss")
  
    expect(page).to have_content("Average Age: 33.5")
  end

  it "does not show actors that are not part of the movie and allows adding an actor" do
    visit "/movies/#{movie_1.id}"

    expect(page).to_not have_content("Jimmy Stewart")
    expect(page).to have_button("Add Actor")

    fill_in "Actor ID", with: actor_3.id
    click_button "Add Actor"
    save_and_open_page
    expect(current_path).to eq "/movies/#{movie_1.id}"
    expect(page).to have_content("Jimmy Stewart")
  end
end
