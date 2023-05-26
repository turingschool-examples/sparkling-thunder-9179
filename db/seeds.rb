# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([( name: "Star Wars" ), ( name: "Lord of the Rings" )])
#   Character.create(name: "Luke", movie: movies.first)

pixar = Studio.create!(name: 'Pixar Animation Studios', location: 'California')

universal = Studio.create!(name: 'Universal Studios', location: 'Orlando')

the_dawn_of_netta = universal.movies.create!(title: 'The Dawn of Netta', creation_year: '1912', genre: 'silent drama')
when_bess_got_in_wrong = universal.movies.create!(title: 'When Bess Got in Wrong', creation_year: '1914', genre: 'silent comedy')

ratatouille = pixar.movies.create!(title: 'Ratatouille', creation_year: '2007', genre: 'comedy')
inside_out = pixar.movies.create!(title: 'Inside Out', creation_year: '2015', genre: 'coming-of-age')
