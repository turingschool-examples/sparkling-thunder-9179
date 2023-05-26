require "rails_helper"

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :casts}
    it {should have_many(:movies).through(:casts)}
  end
end