module MeasurementsHelper
  def units(variable)
    units = {}
    units_list = [
      ["voltage", "V"],
      ["power", "W"],
      ["energy", "kWh"],
      ["temperature", "°C"],
      ["humidity", "%"]
    ]
    units_list.each do |var, unit|
      units[var] = unit
    end
    output = ""
    units.keys.each do |k|
      output = units[k] if variable.downcase.include?(k)
    end
    output
  end
end
