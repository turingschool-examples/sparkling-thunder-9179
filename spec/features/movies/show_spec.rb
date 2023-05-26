require 'rails_helper'

RSpec.describe "/movies/:id" do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Disney", location: "Florida")

    @movie_1 = @studio_1.movies.create!(title: "Speed", creation_year: "1996", genre: "Action")
    @movie_2 = @studio_1.movies.create!(title: "Matrix", creation_year: "1999", genre: "Scifi")
    @movie_3 = @studio_2.movies.create!(title: "Avengers", creation_year: "2006", genre: "Adventure")
    @movie_4 = @studio_2.movies.create!(title: "Babe", creation_year: "1989", genre: "Cartoon")


    @actor_1 = Actor.create!(name:"Keanu Reeves", age: 38)
    @actor_2 = Actor.create!(name: "Sandra Bullock", age: 22)
    @actor_3 = Actor.create!(name: "Chris Evans", age: 32)
    
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_2.id)
    MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @movie_3.id, actor_id: @actor_3.id)
  end
  
  describe "As a user, when I visit a movie's show page" do
    it 'displays the movies title, creation year and genre' do
      visit "/movies/#{@movie_1.id}"
    
      expect(page).to have_content("Title: #{@movie_1.title}")
      expect(page).to have_content("Creation Year: #{@movie_1.creation_year}")
      expect(page).to have_content("Genre: #{@movie_1.genre}")
      expect(page).to_not have_content("Title: #{@movie_2.title}")
      expect(page).to_not have_content("Creation Year: #{@movie_2.creation_year}")
      expect(page).to_not have_content("Genre: #{@movie_2.genre}")

      visit "/movies/#{@movie_2.id}"

      expect(page).to have_content("Title: #{@movie_2.title}")
      expect(page).to have_content("Creation Year: #{@movie_2.creation_year}")
      expect(page).to have_content("Genre: #{@movie_2.genre}")
      expect(page).to_not have_content("Title: #{@movie_3.title}")
      expect(page).to_not have_content("Creation Year: #{@movie_3.creation_year}")
      expect(page).to_not have_content("Genre: #{@movie_3.genre}")
    end
    it 'display a list of all its actors from youngest to oldest' do
      visit "/movies/#{@movie_1.id}"

      expect(@actor_2.name).to appear_before(@actor_1.name)

      visit "/movies/#{@movie_3.id}"

      expect(@actor_3.name).to appear_before(@actor_1.name)
    end
    it "displays the average age of all the movie's actors" do

    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Average age of actors: 30")
    end

    it 'Does not display actors, and I see a form to add an actor, when I fill out the form with an existing actor, i click submit, get redirected to the show page and see the actors name' do
    visit "/movies/#{@movie_4.id}"

    expect(page).to_not have_content(@actor_1.name)

    expect(page).to have_field("Actor ID")

    fill_in("Actor ID", with: "#{@actor_1.id}")

    click_button "Submit"

    expect(current_path).to eq("/movies/#{@movie_4.id}")

    expect(page).to have_content(@actor_1.name)
      
    end
  end
end