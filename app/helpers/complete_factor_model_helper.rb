# This module contains helpers for the CompleteFactorModelController
module CompleteFactorModelHelper
  def self.columns
    CompleteFactorModel.column_names.grep(/_weight$/)
  end

  def self.weight_validator
    /\A\Z|^(?=.+)(?:[1-9]\d*|0)?(?:\.\d+)?$/
  end

  def self.model_name
    /[^\s]/
  end
end
