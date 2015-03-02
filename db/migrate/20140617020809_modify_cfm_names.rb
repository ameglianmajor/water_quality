class ModifyCfmNames < ActiveRecord::Migration
  def change
    add_column :complete_factor_models, :normalized_dibromochloromethane_weight, :float, default: 0.0, null: false
  end
end
