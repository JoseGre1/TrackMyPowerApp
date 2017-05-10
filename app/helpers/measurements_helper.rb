module MeasurementsHelper
  def units(variable)
    units = {}
    units_list = [
      ["voltage", "V"],
      ["current", "A"],
      ["power", "W"],
      ["energy", "kWh"],
      ["temperature", "°C"],
      ["humidity", "%"],
      ["solar", "W/m²"],
      ["speed", "km/h"],
      ["direction", "deg"]
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
