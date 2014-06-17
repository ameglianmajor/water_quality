class AddItemsToWaterSamples < ActiveRecord::Migration
  def change
    add_column :water_samples, :arsenic, :float
    add_column :water_samples, :nitrate, :float
    add_column :water_samples, :alpha_activity, :float
    add_column :water_samples, :beta_activity, :float
    add_column :water_samples, :radium_226, :float
    add_column :water_samples, :radium_228, :float
    add_column :water_samples, :tritium, :float
    add_column :water_samples, :strontium_90, :float
    add_column :water_samples, :uranium, :float
  end
end
