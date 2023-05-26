require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :movies_actors}
    it {should have_many(:movies).through(:movies_actors)}

  end
end