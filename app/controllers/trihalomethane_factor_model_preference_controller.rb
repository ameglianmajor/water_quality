# This controller allows the user to select which trihalomethane factor
# models should be displayed.
class TrihalomethaneFactorModelPreferenceController < ApplicationController
  def update
    model_ids =
      params['trihalomethane_factor_model_preference'].values.map(&:to_i)
    up = current_user.user_preference
    tfms = up.trihalomethane_factor_models
    tfms.each { |model| tfms.delete(model) }
    tfms.push(*model_ids.map { |id| TrihalomethaneFactorModel.find(id) })
    redirect_to home_display_settings_path
  end
end

