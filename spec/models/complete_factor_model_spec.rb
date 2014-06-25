require 'rails_helper'

RSpec.describe CompleteFactorModel, :type => :model do
  describe "has" do
    it "a valid factory." do
      FactoryGirl.create(:complete_factor_model).should be_valid
    end
  end
  describe "method sym_name" do
    it "generates valid symbol names." do
      test_complete_factor_model = FactoryGirl.create(:complete_factor_model)
      expect(test_complete_factor_model.sym_name.to_sym).to eq(:uniform_model_1)
    end
  end
end
