class FixColumnUserPreferences < ActiveRecord::Migration
  def change
    rename_column :users, :user_preferences_id, :user_preference_id
  end
end
