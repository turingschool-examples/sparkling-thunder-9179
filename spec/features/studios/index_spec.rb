require "rails_helper"

RSpec.describe "the studios index" do
  before(:each) do
    @uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @dis = Studio.create!(name: "Disney", location: "LA")
    
    @good = @uni.movies.create!(title: "Goodwill Hunting", creation_year: "1992", genre: "drama")
    @mib = @uni.movies.create!(title: "Men In Black", creation_year: "1997", genre: "animation")
    @toy = @dis.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation")

    @tom = Actor.create!(name: "Tom Hanks", age: 65)
    @matt = Actor.create!(name: "Matt Damon", age: 58)
    @will = Actor.create!(name: "Will Smith", age: 54)

    @good_matt = MoviesActor.create!(movie: @good, actor: @matt)
    @toy_tom = MoviesActor.create!(movie: @toy, actor: @tom)
    @mib_will = MoviesActor.create!(movie: @mib, actor: @will)

    visit "/studios"
  end

  it "lists all the studios with their attributes" do
    expect(page).to have_content("Name: #{@uni.name}")
    expect(page).to have_content("Location: #{@uni.location}")
    expect(page).to have_content("Title: #{@good.title}")
    expect(page).to have_content("Year: #{@good.creation_year}")
    expect(page).to have_content("Genre: #{@good.genre}")

    expect(page).to have_content("Name: #{@uni.name}")
    expect(page).to have_content("Location: #{@uni.location}")
    expect(page).to have_content("Title: #{@mib.title}")
    expect(page).to have_content("Year: #{@mib.creation_year}")
    expect(page).to have_content("Genre: #{@mib.genre}")


    expect(page).to have_content("Name: #{@dis.name}")
    expect(page).to have_content("Location: #{@dis.location}")
    expect(page).to have_content("Title: #{@toy.title}")
    expect(page).to have_content("Year: #{@toy.creation_year}")
    expect(page).to have_content("Genre: #{@toy.genre}")
  end
end