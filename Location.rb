require 'json'
require 'net/http'
class Location
  attr_reader :lat, :long
  def initialize(lat, long=nil)
    if lat.is_a? String
      #takes an address as string and figures out lat/long
      base_url = "http://maps.googleapis.com/maps/api/geocode/json?address="
      lat = lat.gsub(" ", "+")
      url = base_url + lat + "&sensor=false"
      response = Net::HTTP.get_response(URI.parse(url))
      result = JSON.parse(response.body)
      @lat = result["results"][0]["geometry"]["location"]["lat"].to_f
      @long = result["results"][0]["geometry"]["location"]["lng"].to_f
    else #they are numbers (ints or floats)
      @lat = lat.to_f.round(6) #make sure they are floats, then round
      @long = long.to_f.round(6)
    end
  end

  def to_s
    "lat: #{@lat}, long: #{@long}"
  end
end
