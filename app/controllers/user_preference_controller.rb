# This controller allows the user to update his or her preferences.
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
    permit_arguments = UserPreference.column_names.select{ |x| x.include? 'display_' }
    params.require("user_preference").permit(*permit_arguments)
  end
end
