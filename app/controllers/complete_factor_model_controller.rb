# This controller is used by the user to create complete factor models, which
# can be displayed to the user if the user selects the model for display that
# he or she created.
class CompleteFactorModelController < ApplicationController
  def create
    cfm = CompleteFactorModel.new
    cfm.update_attributes(complete_factor_model_params)
    cfm.save
    redirect_to home_display_settings_path
  end

  private

  def complete_factor_model_params
    permit_arguments = CompleteFactorModel.column_names.select { |x| x.include? 'normalized_' }
    params.require('complete_factor_model').permit('name', *permit_arguments)
  end

end