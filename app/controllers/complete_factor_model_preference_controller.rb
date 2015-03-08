# This controller allows the user to select which complete factor
# models should be displayed.
class CompleteFactorModelPreferenceController < ApplicationController
  def update
    model_ids = params['complete_factor_model_preference'].values.map(&:to_i)
    up = current_user.user_preference
    cfms = up.complete_factor_models
    cfms.each { |model| cfms.delete(model) }
    cfms.push(*model_ids.map { |id| CompleteFactorModel.find(id) })
    redirect_to home_water_quality_path
  end
end
