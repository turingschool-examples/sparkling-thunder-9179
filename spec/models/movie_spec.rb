require "rails_helper"

RSpec.describe Movie, type: :model do

  let!(:studio) { Studio.create!(name: "Universal Studios", location: "Hollywood")}

  let!(:movie1) { studio.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")}
  

  let!(:actor1) { movie1.actors.create!(name: "Tim Allen", age: 58)}
  let!(:actor2) { movie1.actors.create!(name: "Jim Varney", age: 65)}
  let!(:actor3) { movie1.actors.create!(name: "Tom Hanks", age: 55)}

  describe "relationships" do
    it {should belong_to :studio}
  end

  describe "instance methods" do
    it "#age_sort" do
    expect(movie1.age_sort).to eq([actor3, actor1, actor2])
    end

    it "#average_age" do
    expect(movie1.average_age).to eq(59)
    end
  end
end
