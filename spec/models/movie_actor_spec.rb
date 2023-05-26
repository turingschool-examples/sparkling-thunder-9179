require "rails_helper"

RSpec.describe MovieActor, type: :model do
  describe "relationship" do
    it { should belong_to :movie}
    it { should belong_to :actor}
  end
end