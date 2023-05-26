require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_and_belong_to_many :actors}
  end

  describe "instance variables" do 
    it "#youngest_actor" do 
      uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      ddarko = uni.movies.create!(title: "Donnie Darko", creation_year: "2000", genre: "Sci-Fi")
      jake = ddarko.actors.create!(name: "Jake Gyllenhaal", age: 42)   
      maggie = ddarko.actors.create!(name: "Maggie Gyllenhaal", age: 45)
      frank = ddarko.actors.create!(name: "Frank", age: 18)

      expect(ddarko.youngest_actor).to eq([frank.name, jake.name, maggie.name])
    end

    it "#average_age_of_actors" do 
      uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
      ddarko = uni.movies.create!(title: "Donnie Darko", creation_year: "2000", genre: "Sci-Fi")
      jake = ddarko.actors.create!(name: "Jake Gyllenhaal", age: 42)   
      maggie = ddarko.actors.create!(name: "Maggie Gyllenhaal", age: 45)
      frank = ddarko.actors.create!(name: "Frank", age: 18)

      expect(ddarko.average_age_of_actors).to eq((jake.age + maggie.age + frank.age)/3)
    end
  end 
end
