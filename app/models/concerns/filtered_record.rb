# This concern adds the ability to filter columns of ActiveRecord models.
module FilteredRecord
  extend ActiveSupport::Concern

  def filtered_columns
    values = attributes.map do |key, value|
      value if self.class.allowed? key
    end
    values.select { |x| x }
  end

  module ClassMethods
    def filtered_columns
      column_names.select { |x| self.allowed?(x) }
    end

    def allowed? value
      case value
        when 'id' then false
        when 'created_at' then false
        when 'updated_at' then false
        when 'name' then false
        else true
      end
    end
  end
end
