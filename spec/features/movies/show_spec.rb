require "rails_helper"

RSpec.describe "movies show page", type: :feature do
  before :each do
    test_data
  end
  describe "as a visitor" do
    describe "when I visit the movies show page" do
      it "I see the movie's title, creation year, and genre" do
        visit "/movies/#{@movie_1.id}"
        save_and_open_page
        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_1.creation_year)
        expect(page).to have_content(@movie_1.genre)

        expect(page).to have_content("Actors in this movie:")
        expect(page).to have_content(@actor_2.name)
        expect(page).to have_content(@actor_1.name)
        # expect(@actor_2.name).to appear_before(@actor_1.name)

        expect(page).to have_content("Average age: #{@movie_1.average_age}")
      end
    end
  end
end