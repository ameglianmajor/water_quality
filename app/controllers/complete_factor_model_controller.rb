class CompleteFactorModelController < ApplicationController
  def create
    cfm = CompleteFactorModel.new
    cfm.update_attributes(complete_factor_model_params)
    cfm.save
    redirect_to home_display_settings_path
  end

  private

  def complete_factor_model_params
    permit_arguments = CompleteFactorModel.column_names.select {|x| x.include? 'normalized_'}
    params.require("complete_factor_model").permit("name", *permit_arguments)
  end

end