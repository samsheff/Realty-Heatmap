import folium
import pandas as pd
from numpy import genfromtxt
from folium.plugins import HeatMap

listings_file = r'listing_coords.csv'
listings = genfromtxt(listings_file, delimiter=',').tolist()


map_osm = folium.Map(location=[43.1198091, 131.8869243], zoom_start=13)
HeatMap(listings).add_to(map_osm)
map_osm.save('osm.html')
