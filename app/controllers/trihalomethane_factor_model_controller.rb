class TrihalomethaneFactorModelController < ApplicationController
  def create
    tfm = TrihalomethaneFactorModel.new
    tfm.update_attributes(trihalomethane_factor_model_params)
    tfm.save
    redirect_to home_display_settings_path
  end

  private

  def trihalomethane_factor_model_params
    permit_arguments = TrihalomethaneFactorModel.column_names.select{|x| x.include? '_weight' }
    params.require("trihalomethane_factor_model").permit("name", *permit_arguments)
  end

end