require "rails_helper"

RSpec.describe "/movies/:id", type: :feature do
  describe "show" do
    before(:each) do
      @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      @movie_1 = @studio_1.movies.create!(title: "Jurassic Park", creation_year: "1995", genre: "action")
      @movie_2 = @studio_1.movies.create!(title: "Oppenheimer", creation_year: "2023", genre: "puzzle")

      @studio_2 = Studio.create!(name: "Pixar", location: "Brea")
      @movie_3 = @studio_2.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")
      @movie_4 = @studio_2.movies.create!(title: "Inside Out", creation_year: "2015", genre: "animation")

      @actor_1 = Actor.create!(name: "Tom Hanks", age: 62)
      @actor_2 = Actor.create!(name: "Meryl Streep", age: 73)
      @actor_3 = Actor.create!(name: "Brad Pitt", age: 55)

      @movie_actor_1 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_1.id)
      @movie_actor_2 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_2.id)
      @movie_actor_3 = MovieActor.create!(movie_id: @movie_1.id, actor_id: @actor_3.id)
    end

    # Story 2 - Movie Show

    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
    it "display information for a particular movie (1)" do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content("Movie Name: #{@movie_1.title}")
      expect(page).to have_content("Creation Year: #{@movie_1.creation_year}")
      expect(page).to have_content("Genre: #{@movie_1.genre}")
    end

    it "list all actors for a particular movie (1) from oldest to youngest" do
      visit "/movies/#{@movie_1.id}"

      expect(@actor_3.name).to appear_before(@actor_1.name)
      expect(@actor_1.name).to appear_before(@actor_2.name)
    end
  end
end
