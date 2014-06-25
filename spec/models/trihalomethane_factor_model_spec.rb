require 'rails_helper'

RSpec.describe TrihalomethaneFactorModel, :type => :model do
  describe "has" do
    it "a valid factory." do
      FactoryGirl.create(:trihalomethane_factor_model).should be_valid
    end
  end
  describe "method sym_name" do
    it "generates valid symbol names." do
      test_trihalomethane_factor_model = FactoryGirl.create(:trihalomethane_factor_model)
      expect(test_trihalomethane_factor_model.sym_name.to_sym).to eq(:clean_model_1)
    end
  end
end
