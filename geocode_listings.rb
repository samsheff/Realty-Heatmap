require 'geocoder'
require 'csv'


CSV.foreach(ARGV[0], {col_sep: ";", headers: true}) do |listing|
  full_address = listing["Город"] + ", " + (listing["Адрес"] || "")
  next if full_address == listing["Город"] + ", "
  coordinates = Geocoder.search(full_address)
  coordinates = coordinates[0].coordinates if coordinates.length > 0 
  puts coordinates[0].to_s + "," + coordinates[1].to_s if coordinates
end
