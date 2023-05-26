require 'rails_helper'

RSpec.describe '/movies/:id' do
  before(:each) do
    @pixar = Studio.create!(name: 'Pixar Animation Studios', location: 'California')

    @universal = Studio.create!(name: 'Universal Studios', location: 'Orlando')

    @the_dawn_of_netta = @universal.movies.create!(title: 'The Dawn of Netta', creation_year: '1912', genre: 'silent drama')
    @when_bess_got_in_wrong = @universal.movies.create!(title: 'When Bess Got in Wrong', creation_year: '1914', genre: 'silent comedy')

    @ratatouille = @pixar.movies.create!(title: 'Ratatouille', creation_year: '2007', genre: 'comedy')
    @inside_out = @pixar.movies.create!(title: 'Inside Out', creation_year: '2015', genre: 'coming-of-age')
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
  end
end