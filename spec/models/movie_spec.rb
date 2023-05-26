RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  let!(:studio) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
  let!(:movie) { studio.movies.create!(title: "Jurassic World", creation_year: "2015", genre: "Sci-Fi") }
  let!(:actor_1) { movie.actors.create!(name: "Chris Pratt", age: 42) }
  let!(:actor_2) { movie.actors.create!(name: "Bryce Dallas Howard", age: 40) }
  let!(:actor_3) { movie.actors.create!(name: "Jeff Goldblum", age: 69) }

  describe 

  describe "#average_age" do
    it "return the movie's actors ordered by age youngest to oldest" do
      expect(movie.order_age).to eq([actor_2, actor_1, actor_3])
    end

    it "returns the average age of the movie's actors" do
      expect(movie.average_actor_age).to be_within(0.01).of(50.33)
    end
  end

end