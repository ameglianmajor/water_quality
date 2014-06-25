require 'rails_helper'

RSpec.describe WaterSample, :type => :model do
  describe "has" do
    it "a valid factory." do
      FactoryGirl.create(:water_sample).should be_valid
    end
  end
end
