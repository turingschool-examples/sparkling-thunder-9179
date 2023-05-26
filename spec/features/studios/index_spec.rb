require 'rails_helper'

RSpec.describe '/index' do
  before(:each) do
    @pixar = Studio.create!{name: 'Pixar Animation Studios', location: 'California'}

    @universal = Studio.create!{name: 'Universal Studios', location: 'Orlando'}

    @the_dawn_of_netta = universal.movies.create!{title: 'The Dawn of Netta', creation_year: '1912', genre: 'silent drama'}
    @when_bess_got_in_wrong = universal.movies.create!{title: 'When Bess Got in Wrong', creation_year: '1914', genre: 'silent comedy'}

    @ratatouille = pixar.movies.create!{title: 'Ratatouille', creation_year: '2007', genre: 'comedy'}
    @inside_out = pixar.movies.create!{title: 'Inside Out', creation_year: '2015', genre: 'coming-of-age'}
  end

  describe 'studio index' do
    it 'displays all studios and respective movies' do 
      visit "/studios" 
      expect(page).to have_header("Studios")
      within("#studios") do 
        expect(page).to have_content(@pixar.name)
        expect(page).to have_content(@pixar.location)
        within('#studio-movies') do 
          expect(page).to have_content(@ratatouille.title)
          expect(page).to have_content(@ratatouille.creation_year)
          expect(page).to have_content(@ratatouille.genre)
          expect(page).to have_content(@inside_out.title)
          expect(page).to have_content(@inside_out.creation_year)
          expect(page).to have_content(@inside_out.genre)
        end

        expect(page).to have_content(@universal.name)
        expect(page).to have_content(@universal.location)
        within('#studio-movies') do 
          expect(page).to have_content(@the_dawn_of_netta.title)
          expect(page).to have_content(@the_dawn_of_netta.creation_year)
          expect(page).to have_content(@the_dawn_of_netta.genre)
          expect(page).to have_content(@when_bess_got_in_wrong.title)
          expect(page).to have_content(@when_bess_got_in_wrong.creation_year)
          expect(page).to have_content(@when_bess_got_in_wrong.genre)
        end
      end
    end
  end
end