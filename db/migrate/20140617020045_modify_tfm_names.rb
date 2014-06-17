class ModifyTfmNames < ActiveRecord::Migration
  def change
    rename_column :trihalomethane_factor_models, :bromodichloromethane, :bromodichloromethane_weight
    rename_column :trihalomethane_factor_models, :dibromochloromethane, :dibromochloromethane_weight
  end
end
