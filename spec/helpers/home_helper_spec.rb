require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, :type => :helper do
  describe "method display" do
    it "outputs the proper capitalized and hyphenated display form for chemicals." do
      expect(helper.display('bromodichloromethane')).to eq('Bromo-dichloromethane')
      expect(helper.display('dibromochloromethane')).to eq('Dibromo-chloromethane')
    end
    it "removes the prefix 'normalized_' and suffix '_weight' when they are present." do
      expect(helper.display('normalized_alpha_activity_weight')).to eq('Alpha Activity')
      expect(helper.display('alpha_activity_weight')).to eq('Alpha Activity')
    end
  end
  describe "method format_entries" do
    it "outputs a rounded decimal when the decimal is greater than 6 digits after the decimal place." do
      expect(helper.format_entries(1.12345678)).to eq(1.123457)
    end
    it "does not modify strings." do
      expect('name').to eq('name')
    end
  end
end
