class CreateTrihalomethaneFactorModels < ActiveRecord::Migration
  def change
    create_table :trihalomethane_factor_models do |t|
      t.float :chloroform_weight, default: 0.0, null: false
      t.float :bromoform_weight, default: 0.0, null: false
      t.float :bromodichloromethane, default: 0.0, null: false
      t.float :dibromochloromethane, default: 0.0, null: false

      t.timestamps
    end
  end
end
