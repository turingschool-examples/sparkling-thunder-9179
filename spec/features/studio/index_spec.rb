require "rails_helper"

RSpec.describe "Studio Index" do
  before :each do 
    @studio1 = Studio.create!(name: "Mountain Max", location: "Colorado")
    @studio2 = Studio.create!(name: "Ocean Max", location: "California")
    @movie1 = @studio1.movies.create!(title: "Going Hiking", creation_year: "1900", genre: "outdoor")
    @movie2 = @studio1.movies.create!(title: "Wanda Goes Barking", creation_year: "2023", genre: "puppies")
    @movie3 = @studio2.movies.create!(title: "Wanda VS The Vacuum", creation_year: "2022", genre: "super hero")
    @movie4 = @studio2.movies.create!(title: "Driving I70", creation_year: "2000", genre: "action")
  end

  it "shows all studios and movies" do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio2.location)

    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)

    expect(page).to have_content(@movie2.title)
    expect(page).to have_content(@movie2.creation_year)
    expect(page).to have_content(@movie2.genre)

    expect(page).to have_content(@movie3.title)
    expect(page).to have_content(@movie3.creation_year)
    expect(page).to have_content(@movie3.genre)

    expect(page).to have_content(@movie4.title)
    expect(page).to have_content(@movie4.creation_year)
    expect(page).to have_content(@movie4.genre)
    save_and_open_page
  end
end