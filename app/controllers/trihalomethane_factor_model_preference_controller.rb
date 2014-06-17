class TrihalomethaneFactorModelPreferenceController < ApplicationController
  def update
    model_ids = params["trihalomethane_factor_model_preference"].collect do |k,v|
      v.to_i
    end
    up = current_user.user_preference
    tfms = up.trihalomethane_factor_models
    tfms.each do |x|
      up.trihalomethane_factor_models.delete(x)
    end
    model_ids.each do |x|
      tfm = TrihalomethaneFactorModel.find(x)
      up.trihalomethane_factor_models << tfm
    end
    redirect_to home_display_settings_path
  end
end