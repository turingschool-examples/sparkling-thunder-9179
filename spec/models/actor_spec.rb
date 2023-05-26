require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "methods" do 
    before(:each) do 
      @universal = Studio.create!(name: 'Universal Studios', location: 'Orlando')
      @when_bess_got_in_wrong = @universal.movies.create!(title: 'When Bess Got in Wrong', creation_year: '1914', genre: 'silent comedy')
      @lee = Actor.create!(name: 'Lee Moran', age: 24)
      @bess = Actor.create!(name: 'Bess Meredyth', age: 22)
    end
  end
end