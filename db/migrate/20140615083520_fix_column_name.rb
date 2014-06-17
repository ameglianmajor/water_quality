class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :employee_id, :user_preferences_id
  end
end
