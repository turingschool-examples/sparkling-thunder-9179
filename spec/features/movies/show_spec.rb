require "rails_helper"

# Story 2 - Movie Show

# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

RSpec.describe "Movies Show Page" do
  before(:each) do
    @studio_a = Studio.create!(name: "Studio A", location: "California")
    @studio_b = Studio.create!(name: "Studio B", location: "India")
    @studio_c = Studio.create!(name: "Studio C", location: "Canada")

    @movie_1 = @studio_a.movies.create!(title: "Life", creation_year: "1977", genre: "drama")
    @movie_2 = @studio_a.movies.create!(title: "Death", creation_year: "1987", genre: "comedy")
    @movie_3 = @studio_b.movies.create!(title: "Going to the Park", creation_year: "1922", genre: "horror")
    @movie_4 = @studio_c.movies.create!(title: "Bubbles", creation_year: "2012", genre: "romance")

    @actor_1 = Actor.create!(name: "Allen", age: 20)
    @actor_2 = Actor.create!(name: "Bailey", age: 40)
    @actor_3 = Actor.create!(name: "Cathey", age: 20)
    @actor_4 = Actor.create!(name: "Darline", age: 10)
    @actor_5 = Actor.create!(name: "Ed", age: 20)
    @actor_6 = Actor.create!(name: "Felleaotha", age: 60)

    @union_1 = Union.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
    @union_2 = Union.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)

    @union_3 = Union.create!(actor_id: @actor_3.id, movie_id: @movie_2.id)
    @union_4 = Union.create!(actor_id: @actor_4.id, movie_id: @movie_2.id)

    @union_6 = Union.create!(actor_id: @actor_1.id, movie_id: @movie_3.id)
    @union_7 = Union.create!(actor_id: @actor_3.id, movie_id: @movie_3.id)
    @union_5 = Union.create!(actor_id: @actor_5.id, movie_id: @movie_3.id)

    @union_9 = Union.create!(actor_id: @actor_2.id, movie_id: @movie_4.id)
    @union_10 = Union.create!(actor_id: @actor_4.id, movie_id: @movie_4.id)
    @union_8 = Union.create!(actor_id: @actor_6.id, movie_id: @movie_4.id)

    @actors = [@actor_1, @actor_2, @actor_3, @actor_4, @actor_5, @actor_6]
    @movies = [@movie_1, @movie_2, @movie_3, @movie_4]
  end

  it "visit movie show page to see information about movie and actors" do
    @movies.each do |movie|
      visit "/movies/#{movie.id}"
    # @movies.each do |movie|
      # within "#movie_show_#{movie.id}" do
        expect(page).to have_content(movie.title)
        expect(page).to have_content(movie.genre)
        expect(page).to have_content(movie.creation_year)
        # movie.actors.each do |actor|
        #   expect(page).to have_content(actor.name)
        #   expect(page).to have_content(actor.age)
        # end
      # end
    # end
    save_and_open_page
    end
  end
end
