class RegistrationsController < Devise::RegistrationsController
  def create
    super
    user_preference = UserPreference.new
    user_preference.save
    current_user.user_preference_id = user_preference.id
    current_user.first_name = params['user']['first_name']
    current_user.last_name = params['user']['last_name']
    current_user.save
  end 
end
