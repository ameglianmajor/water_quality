class TrihalomethaneFactorModelController < ApplicationController
  def create
    tfm = TrihalomethaneFactorModel.new
    tfm.update_attributes(trihalomethane_factor_model_params)
    tfm.save
    redirect_to home_display_settings_path
  end

  private

  def trihalomethane_factor_model_params
    params.require("trihalomethane_factor_model").permit(
      "chloroform_weight",
      "bromoform_weight",
      "bromodichloromethane_weight",
      "dibromochloromethane_weight",
      "name"
    )
  end

end