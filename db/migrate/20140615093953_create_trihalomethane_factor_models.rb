class CreateTrihalomethaneFactorModels < ActiveRecord::Migration
  def change
    create_table :trihalomethane_factor_models do |t|
      t.float :chloroform_weight
      t.float :bromoform_weight
      t.float :bromodichloromethane
      t.float :dibromochloromethane

      t.timestamps
    end
  end
end
