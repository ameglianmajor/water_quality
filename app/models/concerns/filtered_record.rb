# This concern adds the ability to filter columns of ActiveRecord models.
module FilteredRecord
  extend ActiveSupport::Concern

  def filtered_columns
    values = attributes.map do |key, value|
      value if self.class.allowed? key
    end
    values.select { |x| x }
  end

  # The class methods when this Concern is included.
  module ClassMethods
    def filtered_columns
      column_names.select { |x| self.allowed?(x) }
    end

    def allowed?(value)
      %w(id created_at updated_at name).include?(value) ? false : true
    end
  end
end
