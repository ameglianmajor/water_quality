# Home helpers
module HomeHelper
  def display(name)
    new_name = case name
      when 'bromodichloromethane' then 'bromo-dichloromethane'
      when 'dibromochloromethane' then 'dibromo-chloromethane'
      else name.gsub '_', ' '
    end
    new_name.split.map(&:capitalize).join(' ').gsub('Normalized ', '').gsub(' Weight', '')
  end

  def format_entries(element)
    if element.class == Float
      element.round(6)
    else
      element
    end
  end

end
