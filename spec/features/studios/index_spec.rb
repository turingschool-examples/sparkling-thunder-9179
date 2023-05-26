require "rails_helper"

RSpec.describe "Studio Index page /studios", type: :feature do
  before(:each) do
    test_data
  end

  describe "Studio Index page shows all studios and their attributes" do
    it "can show each studio with each movie belonging to that studio" do
      visit '/studios'

      within "#studio_details_#{@studio_1.id}" do
        expect(page).to have_content("Studio Name: #{@studio_1.name}")
        expect(page).to have_content("Studio Location: #{@studio_1.location}")
        expect(page).to have_content("Movies:")
        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_1.creation_year)
        expect(page).to have_content(@movie_1.genre)
      end

      within "#studio_details_#{@studio_2.id}" do
        expect(page).to have_content("Studio Name: #{@studio_2.name}")
        expect(page).to have_content("Studio Location: #{@studio_2.location}")
        expect(page).to have_content("Movies:")
        expect(page).to have_content(@movie_3.title)
        expect(page).to have_content(@movie_3.creation_year)
        expect(page).to have_content(@movie_3.genre)
      end
    end
  end
end