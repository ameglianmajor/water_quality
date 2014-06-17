# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

WaterSample.create(
  site:'Los Angeles Aqueduct Filtration Plant Effluent',
  chloroform: 0.00104,
  bromoform: 0.0,
  bromodichloromethane: 0.00149,
  dibromochloromethane: 0.00275,
  arsenic: 0.00479,
  nitrate: 0.0,
  alpha_activity: 5.13,
  beta_activity: 1.30,
  radium_226: 0.302,
  radium_228: 0.0,
  tritium: 0.0,
  strontium_90: 0.0,
  uranium: 3.38
)

WaterSample.create(
  site:'North Hollywood Pump Station (well blend)',
  chloroform: 0.00291,
  bromoform: 0.00487,
  bromodichloromethane: 0.00547,
  dibromochloromethane: 0.0109,
  arsenic: 0.00223,
  nitrate: 10.0,
  alpha_activity: 5.02,
  beta_activity: 0.401,
  radium_226: 0.120,
  radium_228: 0.0,
  tritium: 0.0,
  strontium_90: 0.0,
  uranium: 4.66
)

WaterSample.create(
  site: 'Jensen Plant Effluent',
  chloroform: 0.00065,
  bromoform: 0.00856,
  bromodichloromethane: 0.0013,
  dibromochloromethane: 0.00428,
  arsenic: 0.00335,
  nitrate: 2.78,
  alpha_activity: 2.63,
  beta_activity: 1.04,
  radium_226: 0.079,
  radium_228: 0.0,
  tritium: 55.0,
  strontium_90: 0.669,
  uranium: 2.45
)

WaterSample.create(
  site: 'Weymouth Plant Effluent',
  chloroform: 0.00971,
  bromoform: 0.00317,
  bromodichloromethane: 0.00931,
  dibromochloromethane: 0.0116,
  arsenic: 0.00239,
  nitrate: 0.0,
  alpha_activity: 5.07,
  beta_activity: 3.68,
  radium_226: 0.223,
  radium_228: 0.0,
  tritium: 44.7,
  strontium_90: 0.323,
  uranium: 5.90
)

ContaminantNormalization.create(
  contaminant: "chloroform",
  normalization_factor: 0.02
)

ContaminantNormalization.create(
  contaminant: "bromoform",
  normalization_factor: 0.02
)

ContaminantNormalization.create(
  contaminant: "bromodichloromethane",
  normalization_factor: 0.02
)

ContaminantNormalization.create(
  contaminant: "dibromochloromethane",
  normalization_factor: 0.02
)

ContaminantNormalization.create(
  contaminant: "arsenic",
  normalization_factor: 0.01
)

ContaminantNormalization.create(
  contaminant: "nitrate",
  normalization_factor: 45.0
)

ContaminantNormalization.create(
  contaminant: "alpha_activity",
  normalization_factor: 15.0
)

ContaminantNormalization.create(
  contaminant: "beta_activity",
  normalization_factor: 4.0
)

ContaminantNormalization.create(
  contaminant: "radium_226",
  normalization_factor: 2.5
)

ContaminantNormalization.create(
  contaminant: "radium_228",
  normalization_factor: 2.5
)

ContaminantNormalization.create(
  contaminant: "tritium",
  normalization_factor: 20000
)

ContaminantNormalization.create(
  contaminant: "strontium_90",
  normalization_factor: 8.0
)

ContaminantNormalization.create(
  contaminant: "uranium",
  normalization_factor: 20.0
)