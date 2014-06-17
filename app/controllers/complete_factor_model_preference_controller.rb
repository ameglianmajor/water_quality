class CompleteFactorModelPreferenceController < ApplicationController
  def update
    model_ids = params["complete_factor_model_preference"].collect do |k,v|
      v.to_i
    end
    up = current_user.user_preference
    cfms = up.complete_factor_models
    cfms.each do |x|
      up.complete_factor_models.delete(x)
    end
    model_ids.each do |x|
      cfm = CompleteFactorModel.find(x)
      up.complete_factor_models << cfm
    end
    redirect_to home_water_quality_path
  end
end
