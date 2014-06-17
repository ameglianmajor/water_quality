class CreateContaminantNormalizations < ActiveRecord::Migration
  def change
    create_table :contaminant_normalizations do |t|
      t.string :contaminant
      t.float :normalization_factor

      t.timestamps
    end
  end
end
