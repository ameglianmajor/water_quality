# This controller is used by the user to create complete factor models, which
# can be displayed to the user if the user selects the model for display that
# he or she created.
class CompleteFactorModelController < ApplicationController

  api :POST,
  'complete_factor_model/create',
  'Post a set of weights defining a complete factor model.'
  description <<-EOS
    This endpoint is used to define a complete factor model.
    A set of weights and a name must be provided.
  EOS
  param :complete_factor_model, Hash, required: true do
    CompleteFactorModelHelper.columns.each do |column|
      param column.to_sym, CompleteFactorModelHelper.weight_validator,
      desc: 'The weight that should be ascribed to this contaminant.', required: false
    end
    param :name, CompleteFactorModelHelper.model_name, desc: "Model's name", required: true
  end
  error 400,
  'Bad Request. Please check that all parameters were provided and '\
  'that the request is syntactically correct.'
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