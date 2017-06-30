# Following distance calculator adopted from https://stackoverflow.com/questions/365826/calculate-distance-between-2-gps-coordinates
require_relative 'city'

def degreesToRadians(degrees)
  degrees * Math::PI / 180
end

def distance(lat1, lon1, lat2, lon2)
  earthRadiusKm = 6371

  dLat = degreesToRadians(lat2-lat1)
  dLon = degreesToRadians(lon2-lon1)

  lat1 = degreesToRadians(lat1);
  lat2 = degreesToRadians(lat2);

  a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2)
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  return earthRadiusKm * c
end


def nearest_neighbor(graph_of_cities, current_city)
  route = [current_city.name]
  until graph_of_cities[0].nil?
    next_city = graph_of_cities[0]
    graph_of_cities.each do |route_option|
      next_city_distance = distance(current_city.lat, current_city.lon, next_city.lat, next_city.lon)
      route_option_distance = distance(current_city.lat, current_city.lon, route_option.lat, route_option.lon)
      if next_city_distance > route_option_distance
        next_city = route_option
      end
    end
    current_city = next_city
    graph_of_cities.delete(next_city)
    route.push(current_city.name)
  end
  route
end

home = City.new("Minneapolis", 44.9778, 93.2650)
city2 = City.new("Chicago", 41.8781, 87.6298)
city3 = City.new("Sioux Falls", 43.5446, 96.7311)
city4 = City.new("Denver", 39.7392, 104.9903)
city5 = City.new("Oklahoma City", 35.4676, 97.5164)
city6 = City.new("Las Vegas", 36.1699, 115.1398)
city7 = City.new("San Francisco", 37.7749, 122.4194)

city_graph = [city2, city4, city3, city7, city6, city5]

trip_route = nearest_neighbor(city_graph, home)
puts trip_route
