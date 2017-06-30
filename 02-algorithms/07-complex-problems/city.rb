class City
  attr_accessor :name
  attr_accessor :lat
  attr_accessor :lon

  def initialize(name, lat, lon)
    @name = name
    @lat = lat
    @lon = lon
  end
end
