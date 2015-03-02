# This controller is used by the user to create trihalomethane_factor_models,
# which can be displayed to the user if the user selects the model for display
# that he or she created.
class TrihalomethaneFactorModelController < ApplicationController
  def create
    tfm = TrihalomethaneFactorModel.new
    tfm.update_attributes(trihalomethane_factor_model_params)
    tfm.save
    redirect_to home_display_settings_path
  end

  private

  def trihalomethane_factor_model_params
    permit_arguments = TrihalomethaneFactorModel.column_names.select{ |x| x.include? '_weight' }
    params.require('trihalomethane_factor_model').permit('name', *permit_arguments)
  end

end