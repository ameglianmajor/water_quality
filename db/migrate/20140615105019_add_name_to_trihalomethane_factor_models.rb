class AddNameToTrihalomethaneFactorModels < ActiveRecord::Migration
  def change
    add_column :trihalomethane_factor_models, :name, :string
  end
end
