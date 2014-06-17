class CreateCompleteFactorModels < ActiveRecord::Migration
  def change
    create_table :complete_factor_models do |t|
      t.float :normalized_chloroform_weight
      t.float :normalized_bromoform_weight
      t.float :normalized_bromodichloromethane_weight
      t.float :normalized_arsenic_weight
      t.float :normalized_nitrate_weight
      t.float :normalized_alpha_activity_weight
      t.float :normalized_beta_activity_weight
      t.float :normalized_radium_226_weight
      t.float :normalized_radium_228_weight
      t.float :normalized_tritium_weight
      t.float :normalized_strontium_90_weight
      t.float :normalized_uranium_weight

      t.timestamps
    end
  end
end
