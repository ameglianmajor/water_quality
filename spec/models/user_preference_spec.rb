require 'rails_helper'

RSpec.describe UserPreference, :type => :model do
  describe "has" do
    it "a valid factory." do
      FactoryGirl.create(:user_preference).should be_valid
    end
  end
end
