require 'rails_helper'

RSpec.describe ContaminantNormalization, :type => :model do
  describe "has" do
    it "a valid factory." do
      FactoryGirl.create(:contaminant_normalization).should be_valid
    end
  end
end
