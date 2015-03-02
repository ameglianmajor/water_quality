class CreateCompleteFactorModels < ActiveRecord::Migration
  def change
    create_table :complete_factor_models do |t|
      t.float :normalized_chloroform_weight, default: 0.0, null: false
      t.float :normalized_bromoform_weight, default: 0.0, null: false
      t.float :normalized_bromodichloromethane_weight, default: 0.0, null: false
      t.float :normalized_arsenic_weight, default: 0.0, null: false
      t.float :normalized_nitrate_weight, default: 0.0, null: false
      t.float :normalized_alpha_activity_weight, default: 0.0, null: false
      t.float :normalized_beta_activity_weight, default: 0.0, null: false
      t.float :normalized_radium_226_weight, default: 0.0, null: false
      t.float :normalized_radium_228_weight, default: 0.0, null: false
      t.float :normalized_tritium_weight, default: 0.0, null: false
      t.float :normalized_strontium_90_weight, default: 0.0, null: false
      t.float :normalized_uranium_weight, default: 0.0, null: false

      t.timestamps
    end
  end
end
