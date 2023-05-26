require "rails_helper"

RSpec.describe "/movies show page" do
  it "displays a specific movies attributes, its actors youngest to oldest and the avg actor age" do
    studio_1 = Studio.create!(name: "Big Production", location: "New York")

    movie_1 = studio_1.movies.create!(title: "Tootles!", creation_year: "1990", genre: "RomCom")
    movie_2 = studio_1.movies.create!(title: "Heartbreaker", creation_year: "2000", genre: "Drama")

    actor_1 = movie_1.actors.create!(name: "Buzz Boy", age: 55)
    actor_2 = movie_1.actors.create!(name: "Lizzy McAlpine", age: 25)
    actor_3 = movie_1.actors.create!(name: "Starlight Starbright", age: 130)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("#{movie_1.title}")
    expect(page).to have_content("Creation Year: #{movie_1.creation_year}")
    expect(page).to have_content("Genre: #{movie_1.genre}")

    expect(page).to_not have_content("#{movie_2.title}")
    expect(page).to_not have_content("Creation Year: #{movie_2.creation_year}")
    expect(page).to_not have_content("Genre: #{movie_2.genre}")

    within "#movie-#{movie_1.id}-actors" do
      expect(actor_2.name).to appear_before(actor_1.name)
      expect(actor_1.name).to appear_before(actor_3.name)

      expect(page).to have_content("Average Age of All Actors: 70")
    end
  end

  it "only displays the actors associated with the selected movie" do
    studio_1 = Studio.create!(name: "Big Production", location: "New York")

    movie_1 = studio_1.movies.create!(title: "Tootles!", creation_year: "1990", genre: "RomCom")
    movie_2 = studio_1.movies.create!(title: "Heartbreaker", creation_year: "2000", genre: "Drama")

    actor_1 = movie_1.actors.create!(name: "Buzz Boy", age: 55)
    actor_2 = movie_1.actors.create!(name: "Lizzy McAlpine", age: 25)
    actor_3 = movie_1.actors.create!(name: "Starlight Starbright", age: 130)

    actor_4 = movie_2.actors.create!(name: "Lily Porterhouse", age: 39)
    actor_5 = movie_2.actors.create!(name: "Billy Joe RobinHood", age: 90)

    visit "/movies/#{movie_1.id}"

    within "#movie-#{movie_1.id}-actors" do
      expect(actor_2.name).to appear_before(actor_1.name)
      expect(actor_1.name).to appear_before(actor_3.name)
      expect(page).to have_content("Average Age of All Actors: 70")

      expect(page).to_not have_content(actor_4.name)
      expect(page).to_not have_content(actor_4.age)
      expect(page).to_not have_content(actor_5.name)
      expect(page).to_not have_content(actor_5.age)
    end
  end

  it "displays a form to add an existing actor to the specific movie" do
    studio_1 = Studio.create!(name: "Big Production", location: "New York")

    movie_1 = studio_1.movies.create!(title: "Tootles!", creation_year: "1990", genre: "RomCom")

    actor_1 = movie_1.actors.create!(name: "Buzz Boy", age: 55)
    actor_2 = movie_1.actors.create!(name: "Lizzy McAlpine", age: 25)
    actor_3 = movie_1.actors.create!(name: "Starlight Starbright", age: 130)

    actor_4 = Actor.create!(name: "Florence Pugh", age: 27)

    visit "/movies/#{movie_1.id}"

    within "#movie-#{movie_1.id}-actors" do
      expect(page).to_not have_content("#{actor_4.name}")
      expect(page).to_not have_content("#{actor_4.age}")
    end

    fill_in :actor_id, with: actor_4.id
    click_button "Submit"

    expected = "/movies/#{movie_1.id}"
    actual = current_path
    expect(actual).to eq(expected)
  
    within "#movie-#{movie_1.id}-actors" do
      expect(page).to have_content("#{actor_4.name}")
      expect(page).to have_content("#{actor_4.age}")
    end
  end
end