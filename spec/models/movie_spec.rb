require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movies_actors}
    it {should have_many(:actors).through(:movies_actors)}

  end
end
