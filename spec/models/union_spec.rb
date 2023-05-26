require "rails_helper"

RSpec.describe Union, type: :model do
  describe " relationships" do
    it { should belong_to :movie}
    it { should belong_to :actor}
  end
end