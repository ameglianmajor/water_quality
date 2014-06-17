class CompleteFactorModelController < ApplicationController
  def create
    cfm = CompleteFactorModel.new
    cfm.update_attributes(complete_factor_model_params)
    cfm.save
    redirect_to home_display_settings_path
  end

  private

  def complete_factor_model_params
    params.require("complete_factor_model").permit(
      "normalized_chloroform_weight",
      "normalized_bromoform_weight",
      "normalized_bromodichloromethane_weight",
      "normalized_dibromochloromethane_weight",
      "normalized_arsenic_weight",
      "normalized_nitrate_weight",
      "normalized_alpha_activity_weight",
      "normalized_beta_activity_weight",
      "normalized_radium_226_weight",
      "normalized_radium_228_weight",
      "normalized_tritium_weight",
      "normalized_strontium_90_weight",
      "normalized_uranium_weight",
      "name"
    )
  end

end