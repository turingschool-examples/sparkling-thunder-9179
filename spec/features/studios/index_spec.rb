require "rails_helper" 

RSpec.describe "studios index page", type: :feature do
  before(:each) do 
    @studio_1 = Studio.create!(name: "Wolfie Productions", location: "Boulder, CO")
    @studio_2 = Studio.create!(name: "Juno Films", location: "Denver, CO")

    @movie_1 = @studio_1.movies.create!(title: "The dog chew", creation_year: "2022", genre: "Drama")
    @movie_2 = @studio_1.movies.create!(title: "How to catch a squirrel", creation_year: "2023", genre: "Action")
    @movie_3 = @studio_1.movies.create!(title: "What is that smell?", creation_year: "2021", genre: "Suspense")
    
    @movie_4 = @studio_2.movies.create!(title: "Chew the World", creation_year: "2020", genre: "Adventure")
    @movie_5 = @studio_2.movies.create!(title: "Gimme that squeak toy", creation_year: "2020", genre: "Thriller")
    @movie_6 = @studio_2.movies.create!(title: "Can I have a cookie?", creation_year: "2022", genre: "Comedy")
    @movie_7 = @studio_2.movies.create!(title: "Save the kid from the well", creation_year: "2018", genre: "Family")
  end

  it "displays a list of all studios with their name and locaiton" do 
    visit studios_path
  
    expect(page).to have_content("#{@studio_1.name}")
    expect(page).to have_content("#{@studio_2.name}")
    expect(page).to have_content("#{@studio_1.location}")
    expect(page).to have_content("#{@studio_2.location}")
  end

  it "displays a list of all of each studio's movies and their attributes under the studio" do 
    visit studios_path

    within "#studio-#{@studio_1.id}" do 
      # expect(page).to_not have_content("#{@movie_7.title}")
      expect(page).to have_content("#{@movie_1.title}")
      expect(page).to have_content("#{@movie_1.creation_year}")
      expect(page).to have_content("#{@movie_1.genre}")
      expect(page).to have_content("#{@movie_2.title}")
      expect(page).to have_content("#{@movie_2.creation_year}")
      expect(page).to have_content("#{@movie_2.genre}")
      expect(page).to have_content("#{@movie_3.title}")
      expect(page).to have_content("#{@movie_3.creation_year}")
      expect(page).to have_content("#{@movie_3.genre}")
    end

    within "#studio-#{@studio_2.id}" do 
      expect(page).to have_content("#{@movie_4.title}")
      expect(page).to have_content("#{@movie_4.creation_year}")
      expect(page).to have_content("#{@movie_4.genre}")
      expect(page).to have_content("#{@movie_5.title}")
      expect(page).to have_content("#{@movie_5.creation_year}")
      expect(page).to have_content("#{@movie_5.genre}")
      expect(page).to have_content("#{@movie_6.title}")
      expect(page).to have_content("#{@movie_6.creation_year}")
      expect(page).to have_content("#{@movie_6.genre}")
      expect(page).to have_content("#{@movie_7.title}")
      expect(page).to have_content("#{@movie_7.creation_year}")
      expect(page).to have_content("#{@movie_7.genre}")
      expect(page).to_not have_content("#{@movie_1.title}")
    end
  end
end