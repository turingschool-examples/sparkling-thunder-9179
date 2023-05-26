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
    @stella = Actor.create!(name: 'Stella Adams', age: 29)
    
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
    
    it 'adds existing actors to movies' do 
      visit "/movies/#{@when_bess_got_in_wrong.id}"

      within ("#add-an-actor") do
      expect(page).to have_content('Add an Actor')
      expect(page).to have_button('Submit')
      expect(page).to have_field(:actor_id)
      
      fill_in(:actor_id, with: @stella.id)
      click_button('Submit')
    end
    
    expect(current_path).to eq("/movies/#{@when_bess_got_in_wrong.id}")
    
    within("#actors") do 
      expect(page).to have_content("Stella Adams")
    end
    
    expect(page).to have_content('Average Age of Actors: 25')
  end
end

it 'adds actors to other existing movies' do 
  visit "/movies/#{@ratatouille.id}" 
  within("#add-an-actor") do 
    expect(page).to have_content('Add an Actor')
    expect(page).to have_button('Submit')
    expect(page).to have_field(:actor_id)

    fill_in(:actor_id, with: @patton.id)
    click_button('Submit')
  end

    expect(current_path).to eq("/movies/#{@ratatouille.id}")

    within("#actors") do 
      expect(page).to have_content(@patton.name)
    end

    expect(page).to have_content("Average Age of Actors: 54")
  end
end