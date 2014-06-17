module HomeHelper
  def display name
    new_name = case name
      when 'bromodichloromethane' then 'bromo-dichloromethane'
      when 'dibromochloromethane' then 'dibromo-chloromethane'
      else name.sub '_', ' '
    end
    new_name.split.map(&:capitalize).join(' ')
  end

  def format_entries element
    if element.class == Float
      element.round(6)
    else
      element
    end
  end

end
