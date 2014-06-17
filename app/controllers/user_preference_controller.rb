class UserPreferenceController < ApplicationController
  def update
    up = current_user.user_preference
    up.set_options_to_false
    up.update_attributes(user_preference_params)
    up.save
    redirect_to home_display_settings_path
  end

  private

  def user_preference_params
    params.require("user_preference").permit(
      "display_chloroform",
      "display_bromoform",
      "display_bromodichloromethane",
      "display_dibromochloromethane",
      "display_arsenic",
      "display_nitrate",
      "display_alpha_activity",
      "display_beta_activity",
      "display_radium_226",
      "display_radium_228",
      "display_tritium",
      "display_strontium_90",
      "display_uranium"
    )
  end

end
