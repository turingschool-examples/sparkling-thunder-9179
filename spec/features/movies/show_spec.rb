require "rails_helper" 

RSpec.describe "movies show page", type: :feature do
  before(:each) do 
    @studio_1 = Studio.create!(name: "Wolfie Productions", location: "Boulder, CO")
    @studio_2 = Studio.create!(name: "Juno Films", location: "Denver, CO")

    @movie_1 = @studio_1.movies.create!(title: "The dog chew", creation_year: "2022", genre: "Drama")
    @movie_2 = @studio_1.movies.create!(title: "How to catch a squirrel", creation_year: "2023", genre: "Action")
    
    @actor_1 = Actor.create!(age: 3, name: "Can Has Cheezburgr")                                          
    @actor_2 = Actor.create!(age: 6, name: "Sir Wiggles")                                          
    @actor_4 = Actor.create!( age: 0, name: "Brutus")                                          
    @actor_5 = Actor.create!(age: 5, name: "Mo")                                          
    @actor_6 = Actor.create!(age: 7, name: "Bacon")                                          
    @actor_7 = Actor.create!( age: 4, name: "Mrs. Doubtfire")  
    MovieActor.create!(movie: @movie_1, actor: @actor_1)
    MovieActor.create!(movie: @movie_1, actor: @actor_2)
    MovieActor.create!(movie: @movie_1, actor: @actor_4)
    MovieActor.create!(movie: @movie_1, actor: @actor_5)
    MovieActor.create!(movie: @movie_1, actor: @actor_6)

    MovieActor.create!(movie: @movie_2, actor: @actor_6)
    MovieActor.create!(movie: @movie_2, actor: @actor_7)
  end
  
  it "displays a movie's title, creation year, genre" do 
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Title: #{@movie_1.title}")
    expect(page).to have_content("Year: #{@movie_1.creation_year}")
    expect(page).to have_content("Genre: #{@movie_1.genre}")
  end
  
  it "displays a list of the movie's actors from youngest to oldest" do 
    visit "/movies/#{@movie_1.id}"
    
    expect(page).to have_content("Actors:")
    expect(page).to have_content("#{@actor_4.name}").to appear_before("#{@actor_1.name}")
    expect(page).to have_content("#{@actor_7.name}").to appear_before("#{@actor_5.name}")
    expect(page).to have_content("#{@actor_2.name}").to appear_before("#{@actor_6.name}")
    expect(page).to have_content("#{@actor_6.name}").to_not appear_before("#{@actor_4.name}")
  end
  
  it "displays an average age of all the movie's actors" do 
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Average Actor's Age: 4.17")
  end
end