require 'rails_helper'

RSpec.describe '/movies/:id' do
  before(:each) do
    @pixar = Studio.create!(name: 'Pixar Animation Studios', location: 'California')

    @universal = Studio.create!(name: 'Universal Studios', location: 'Orlando')

    @when_bess_got_in_wrong = @universal.movies.create!(title: 'When Bess Got in Wrong', creation_year: '1914', genre: 'silent comedy')

    @ratatouille = @pixar.movies.create!(title: 'Ratatouille', creation_year: '2007', genre: 'comedy')
    @inside_out = @pixar.movies.create!(title: 'Inside Out', creation_year: '2015', genre: 'coming-of-age')

    @lee = Actor.create!(name: 'Lee Moran', age: 24)
    @bess = Actor.create!(name: 'Bess Meredyth', age: 22)
    
    @patton = Actor.create!(name: 'Patton Oswalt', age: 54)

    MovieActor.create(movie: @when_bess_got_in_wrong, actor: @lee)
    MovieActor.create(movie: @when_bess_got_in_wrong, actor: @bess)
  end

  describe 'movie show page' do 
    describe 'movie show page displays attributes, sorted actors, and average age of actors' do
      it 'displays attributes' do 
        visit "/movies/#{@when_bess_got_in_wrong.id}"
        within("#stats") do 
          expect(page).to have_content(@when_bess_got_in_wrong.title)
          expect(page).to have_content("Created: #{@when_bess_got_in_wrong.creation_year}")
          expect(page).to have_content("Genre: #{@when_bess_got_in_wrong.genre}")
        end
      end
    end
    
    it 'displays actors' do 
      visit "/movies/#{@when_bess_got_in_wrong.id}"
      within("#actors") do 
        expect(page).to have_content(@lee.name)
        expect(page).to have_content(@bess.name)
      end
    end
    
    it 'sorts actors by age' do 
      visit "/movies/#{@when_bess_got_in_wrong.id}"
      within ("#actors") do 
        expect(@bess.name).to appear_before(@lee.name)
        expect(@lee.name).to_not appear_before(@bess.name)
      end
    end
    
    it 'displays average age of actors' do 
      visit "/movies/#{@when_bess_got_in_wrong.id}"
      expect(page).to have_content('Average Age of Actors: 23')
    end

    # User Story 3
    it 'does not display actors not in a movie' do 
      visit "/movies/#{@when_bess_got_in_wrong.id}" 
      within("#actors") do 
          expect(page).to_not have_content(@patton.name)
        end
    end
    
    it 'does not display actors not in a movie' do 
      visit "/movies/#{@when_bess_got_in_wrong.id}"

      within ("#add-an-actor") do
      expect(page).to have_button('Add an Actor')
      expect(page).to have_field(:name)
      expect(page).to have_field(:age)
      fill_in(:name, with: 'Stella Adams')
      fill_in(:age, with: 29)
      click_button('Add an Actor')
    end

      expect(current_path).to eq("/movies/#{@when_bess_got_in_wrong.id}")

      within("#actors") do 
      expect(page).to have_content("Stella Adams")
    end

      expect(page).to have_content('Average Age of Actors: 25')
    end
  end
end
  # Story 3
  # Add an Actor to a Movie
  
  # As a user,
  # When I visit a movie show page,
  
  # And I see a form to add an actor to this movie
  # When I fill in the form with the ID of an actor that exists in the database
  # And I click submit 
  # Then I am redirected back to that movie's show page
  # And I see the actor's name is now listed
  # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)