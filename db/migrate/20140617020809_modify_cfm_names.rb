class ModifyCfmNames < ActiveRecord::Migration
  def change
    add_column :complete_factor_models, :normalized_dibromochloromethane_weight, :float
  end
end
