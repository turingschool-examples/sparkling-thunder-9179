require "rails_helper"

RSpec.describe "/movies/:id" do
  describe "as a visitor" do
    describe "when I visit a movies show page" do
      # As a user,
      # When I visit a movie's show page.
      # I see the movie's title, creation year, and genre,
      # and a list of all its actors from youngest to oldest.
      # And I see the average age of all of the movie's actors
      it "displays the movies title, creation year, and genre" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
        studio_2 = Studio.create!(name: "Janbarra Studios", location: "Somewhere Else")

        movie_1 = studio_1.movies.create!(title: "Wayne's World", creation_year: "1992", genre: "Amazing")
        movie_2 = studio_1.movies.create!(title: "Bill and Ted's Excellent Adventure", creation_year: "2000", genre: "Action")
        movie_3 = studio_2.movies.create!(title: "Passion of the Christ", creation_year: "1", genre: "Horror")

        visit "/movies/#{movie_1.id}"

        expect(page).to have_content("Movie Title: #{movie_1.title}")
        expect(page).to have_content("Year Created: #{movie_1.creation_year}")
        expect(page).to have_content("Genre: #{movie_1.genre}")

        expect(page).to_not have_content("Movie Title: #{movie_2.title}")
        expect(page).to_not have_content("Year Created: #{movie_2.creation_year}")
        expect(page).to_not have_content("Genre: #{movie_2.genre}")

        visit "/movies/#{movie_2.id}"

        expect(page).to have_content("Movie Title: #{movie_2.title}")
        expect(page).to have_content("Year Created: #{movie_2.creation_year}")
        expect(page).to have_content("Genre: #{movie_2.genre}")

        expect(page).to_not have_content("Movie Title: #{movie_3.title}")
        expect(page).to_not have_content("Year Created: #{movie_3.creation_year}")
        expect(page).to_not have_content("Genre: #{movie_3.genre}")
      end

      it "displays a list of all its actors from youngest to oldest" do
        studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
        studio_2 = Studio.create!(name: "Janbarra Studios", location: "Somewhere Else")

        movie_1 = studio_1.movies.create!(title: "Wayne's World", creation_year: "1992", genre: "Amazing")
        movie_2 = studio_1.movies.create!(title: "Bill and Ted's Excellent Adventure", creation_year: "2000", genre: "Action")
        movie_3 = studio_2.movies.create!(title: "Passion of the Christ", creation_year: "1", genre: "Horror")

        actor_1 = Actor.create!(name: "Keanu", age: 132)
        actor_2 = Actor.create!(name: "Wayne", age: 34)
        actor_3 = Actor.create!(name: "Garth", age: 31)

        mov_act_1= MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
        mov_act_2= MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)
        mov_act_3= MovieActor.create!(movie_id: movie_2.id, actor_id: actor_1.id)
        mov_act_4= MovieActor.create!(movie_id: movie_3.id, actor_id: actor_1.id)

        visit "/movies/#{movie_1.id}"
        
        expect(actor_3.name).to appear_before(actor_2.name)
      end

      it "displays an average age of all the movies actors" do

      end
    end
  end
end