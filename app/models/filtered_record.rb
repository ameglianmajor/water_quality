module FilteredRecord

  def filtered_columns
    values = self.attributes.map do |key, value|
      value if self.class.allowed? key
    end
    values.select{|x| x}
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def filtered_columns
      self.column_names.select {|x| self.allowed?(x) }
    end

    def allowed? value
      case value
        when 'id' then false
        when 'created_at' then false
        when 'updated_at' then false
        else true
      end
    end
  end

end
