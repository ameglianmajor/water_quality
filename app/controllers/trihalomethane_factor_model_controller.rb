# This controller is used by the user to create trihalomethane_factor_models,
# which can be displayed to the user if the user selects the model for display
# that he or she created.
class TrihalomethaneFactorModelController < ApplicationController
  api :POST,
      'trihalomethane_factor_model/create',
      'Post a set of weights defining a trihalomethane factor model.'
  description <<-EOS
    This endpoint is used to define a trihalomethane factor model.
    A set of weights and a name must be provided.
  EOS
  param :trihalomethane_factor_model, Hash, required: true do
    TrihalomethaneFactorModelHelper.columns.each do |column|
      param column.to_sym, TrihalomethaneFactorModelHelper.weight_validator,
            desc: 'The weight that should be ascribed to this contaminant.',
            required: false
    end
    param :name,
          TrihalomethaneFactorModelHelper.model_name,
          desc: "Model's name", required: true
  end
  error 400,
        'Bad Request. Please check that all parameters were provided and '\
        'that the request is syntactically correct.'
  def create
    tfm = TrihalomethaneFactorModel.new
    tfm.update_attributes(trihalomethane_factor_model_params)
    tfm.save
    redirect_to home_display_settings_path
  end

  private

  def trihalomethane_factor_model_params
    permit_arguments =
      TrihalomethaneFactorModel.column_names.select { |x| x.include? '_weight' }
    params.require('trihalomethane_factor_model').permit('name', *permit_arguments)
  end
end
