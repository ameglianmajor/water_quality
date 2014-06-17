class AddNameToCompleteFactorModels < ActiveRecord::Migration
  def change
    add_column :complete_factor_models, :name, :string
  end
end
