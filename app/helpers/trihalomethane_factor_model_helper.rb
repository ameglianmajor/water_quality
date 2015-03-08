# This module contains helpers for the TrihalomethaneFactorModelController
module TrihalomethaneFactorModelHelper
  def self.columns
    TrihalomethaneFactorModel.column_names.grep(/_weight$/)
  end

  def self.weight_validator
    /\A\Z|^(?=.+)(?:[1-9]\d*|0)?(?:\.\d+)?$/
  end

  def self.model_name
    /[^\s]/
  end
end
