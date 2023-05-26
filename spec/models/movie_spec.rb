require "rails_helper"

RSpec.describe Movie, type: :model do
  before(:each) do
    test_data
  end
  
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many :actors}
  end

  describe "instance methods" do
    describe "#actor_age_order" do
      it "can list actors for a specific movie in order based on age" do
        expect(@movie_2.actor_age_order).to eq([@actor_2, @actor_3, @actor_1])
        expect(@movie_3.actor_age_order).to eq([@actor_4, @actor_3])
        expect(@movie_4.actor_age_order).to eq([@actor_5, @actor_4, @actor_1])
      end
    end
  end
end
