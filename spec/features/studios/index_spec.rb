require "rails_helper"

RSpec.describe 'Studios Index Page', type: :features do
  let!(:universal) { Studio.create!(name: "Universal Studios", location: "Studio City, CA") }
  let!(:mgm) { Studio.create!(name: "MGM", location: "Culver City, CA") }
  let!(:warner) { Studio.create!(name: "Warner Bros", location: "Culver City, CA") }
  let!(:ace) { warner.movies.create!(title: "Ace Ventura Pet Detective", creation_year: "1994", genre: "comedy") }
  let!(:mp) { universal.movies.create!(title: "Major Payne", creation_year: "1995", genre: "comedy") }
  let!(:terminator) { mgm.movies.create!(title: "The Terminator", creation_year: "1984", genre: "Sci-fi") }

  describe 'Displays all studios and attributes' do
    it 'Should display all studios including name and location' do
      visit "/studios"

      expect(page).to have_content(universal.name)
      expect(page).to have_content(universal.location)
      expect(page).to have_content(mgm.name)
      expect(page).to have_content(mgm.location)
    end

    it "Should display the movies' attributes associated with each studio" do
      visit "/studios"

      expect(page).to have_content(ace.title)
      expect(page).to have_content(ace.creation_year)
      expect(page).to have_content(ace.genre)
      expect(page).to have_content(mp.title)
      expect(page).to have_content(mp.creation_year)
      expect(page).to have_content(mp.genre)
      expect(page).to have_content(terminator.title)
      expect(page).to have_content(terminator.creation_year)
      expect(page).to have_content(terminator.genre)
    end
  end
end
#save_and_open_page
