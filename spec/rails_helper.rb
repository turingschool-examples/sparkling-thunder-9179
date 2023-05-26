def test_data
  @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
  @studio_2 = Studio.create!(name: "MGM", location: "Hollywood")

  @movie_1 = @studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: "1981", genre: "Action/Adventure")
  @movie_2 = @studio_1.movies.create!(title: "Jurassic Park", creation_year: "1993", genre: "Action/Adventure")
  @movie_3 = @studio_2.movies.create!(title: "Ready Player One", creation_year: "2018", genre: "Sci-Fi/Adventure")
  @movie_4 = @studio_2.movies.create!(title: "The Longest Ride", creation_year: "2015", genre: "Romance/Drama")

  @actor_1 = Actor.create!(name: "Harrison Ford", age: 80)
  @actor_2 = Actor.create!(name: "Karen Allen", age: 71)

  @actor_3 = Actor.create!(name: "Laura Dern", age: 56)
  @actor_4 = Actor.create!(name: "Jeff Goldblum", age: 70)

  @actor_5 = Actor.create!(name: "Tye Sheridan", age: 24)
  @actor_6 = Actor.create!(name: "Olivia Cooke", age: 29)

  @actor_7 = Actor.create!(name: "Scott Eastwood", age: 37)
  @actor_8 = Actor.create!(name: "Britt Robertson", age: 33)

  ActorMovie.create!(actor: @actor_1, movie: @movie_1)
  ActorMovie.create!(actor: @actor_2, movie: @movie_1)

  ActorMovie.create!(actor: @actor_3, movie: @movie_2)
  ActorMovie.create!(actor: @actor_4, movie: @movie_2)

  ActorMovie.create!(actor: @actor_5, movie: @movie_3)
  ActorMovie.create!(actor: @actor_6, movie: @movie_3)

  ActorMovie.create!(actor: @actor_7, movie: @movie_4)
  ActorMovie.create!(actor: @actor_8, movie: @movie_4)
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end