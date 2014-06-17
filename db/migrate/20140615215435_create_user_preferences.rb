class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.boolean :display_chloroform
      t.boolean :display_bromoform
      t.boolean :display_bromodichloromethane
      t.boolean :display_dibromochloromethane
      t.boolean :display_arsenic
      t.boolean :display_nitrate
      t.boolean :display_alpha_activity
      t.boolean :display_beta_activity
      t.boolean :display_radium_226
      t.boolean :display_radium_228
      t.boolean :display_tritium
      t.boolean :display_strontium_90
      t.boolean :display_uranium

      t.timestamps
    end
  end
end
