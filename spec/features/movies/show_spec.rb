require "rails_helper"

RSpec.describe "Movie Show Page" do
  before :each do 
    @studio1 = Studio.create!(name: "Mountain Max", location: "Colorado")
    @studio2 = Studio.create!(name: "Ocean Max", location: "California")

    @movie1 = @studio1.movies.create!(title: "Going Hiking", creation_year: "1900", genre: "outdoor")
    @movie2 = @studio1.movies.create!(title: "Wanda Goes Barking", creation_year: "2023", genre: "puppies")
    @movie3 = @studio2.movies.create!(title: "Wanda VS The Vacuum", creation_year: "2022", genre: "super hero")
    @movie4 = @studio2.movies.create!(title: "Driving I70", creation_year: "2000", genre: "action")

    @actor1 = @movie3.actors.create!(name: "Tom Cruise", age: 75)
    @actor2 = @movie3.actors.create!(name: "Wanda", age: 6)
    @actor3 = @movie4.actors.create!(name: "Johnny Depp", age: 60)
  end

  it "shows movies and cast" do
    # Story 2 - Movie Show

    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors

    visit "/movies/#{@movie3.id}"

    expect(page).to have_content(@movie3.title)
    expect(page).to have_content(@movie3.creation_year)
    expect(page).to have_content(@movie3.genre)


    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor2.name)
    expect(@actor2.name).to appear_before(@actor1.name)


    expect(page).to have_content("Average Age of Cast")
    expect(@movie3.average_actor_age).to eq(40)
  end

  it "adds actors to cast for movie" do
    # Story 3
    # Add an Actor to a Movie

    # As a user,
    # When I visit a movie show page,
    # I do not see any actors listed that are not part of the movie
    # And I see a form to add an actor to this movie
    # When I fill in the form with the ID of an actor that exists in the database
    # And I click submit
    # Then I am redirected back to that movie's show page
    # And I see the actor's name is now listed
    # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
    
    visit "/movies/#{@movie4.id}"

    expect(page).to have_content(@actor3.name)
    expect(page).to_not have_content(@actor1.name)
    expect(page).to_not have_content(@actor2.name)
    expect(page).to have_content("Average Age of Cast")
    expect(@movie4.average_actor_age).to eq(60)
    expect(page).to have_content("Add Actor to Cast")

    fill_in "Actor", with: "#{@actor1.id}"
    click_button "Submit"
    expect(current_path).to eq("/movies/#{@movie4.id}")

    expect(page).to have_content(@actor3.name)
    expect(page).to have_content(@actor1.name)
    expect(@actor3.name).to appear_before(@actor1.name)
    expect(@movie4.average_actor_age).to eq(67)
  end
end