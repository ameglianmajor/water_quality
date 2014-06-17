class AddCompleteFactorModelsUserPreferencesTable < ActiveRecord::Migration
  def self.up
    create_table :complete_factor_models_user_preferences, :id => false do |t|
      t.references :complete_factor_model, :null => false
      t.references :user_preference, :null => false
    end

    add_index :complete_factor_models_user_preferences, [:complete_factor_model_id, :user_preference_id], :unique => true, :name => 'cfmup'

  end

  def self.down
    drop_table :complete_factor_models_user_preferences
  end
end
