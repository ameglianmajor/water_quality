# This controller allows the user to select which trihalomethane factor
# models should be displayed.
class TrihalomethaneFactorModelPreferenceController < ApplicationController
  api :POST,
      'trihalomethane_factor_model_preference/update',
      'Post a set of trihalomethane_factor_models that should be displayed.'
  description <<-EOS
    Post a set of trihalomethane_factor_models that should be displayed.
  EOS
  #param :trihalomethane_factor_model_preference, Hash, required: true do
  #  TrihalomethaneFactorModelHelper.columns.each do |column|
  #    param column.to_sym, TrihalomethaneFactorModelHelper.weight_validator,
  #    desc: 'The weight that should be ascribed to this contaminant.',
  #    required: false
  #  end
  #  param :name,
  #  TrihalomethaneFactorModelHelper.model_name,
  #  desc: "Model's name", required: true
  #end
  error 400,
  'Bad Request. Please check that all parameters were provided and '\
        'that the request is syntactically correct.'
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

