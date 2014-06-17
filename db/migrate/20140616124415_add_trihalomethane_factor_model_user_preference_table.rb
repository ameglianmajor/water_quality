class AddTrihalomethaneFactorModelUserPreferenceTable < ActiveRecord::Migration
  def self.up
    create_table :trihalomethane_factor_models_user_preferences, :id => false do |t|
      t.references :trihalomethane_factor_model, :null => false
      t.references :user_preference, :null => false
    end

    add_index :trihalomethane_factor_models_user_preferences, [:trihalomethane_factor_model_id, :user_preference_id], :unique => true, :name => 'tfmup'

  end

  def self.down
    drop_table :trihalomethane_factor_models_user_preferences
  end

end
