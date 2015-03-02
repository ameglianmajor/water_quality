# This controller is used to handle the actions triggered by the tabs on the
# home page.
class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:display_settings, :create_model]

  def index
  end

  def water_quality
    @all_sites = WaterSample.all
    @length = WaterSample.column_names.length
    @user_preference = current_user ? current_user.user_preference : nil
  end

  def about
  end

  def display_settings
    @all_trihalomethane_factor_models = TrihalomethaneFactorModel.all
    @all_complete_factor_models = CompleteFactorModel.all
  end

  def create_model
  end
end
