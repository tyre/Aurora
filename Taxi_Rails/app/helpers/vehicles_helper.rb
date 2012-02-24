module VehiclesHelper
  def geo_image(lat, lng, width=640, height=640) #returns a url to a static map of the given coordinates
    base_url = "http://maps.googleapis.com/maps/api/staticmap?size="+width.to_s+"x"+height.to_s+"&"
    marker = "markers=size:mid|color:green|label:green|"+lat.to_s+","+lng.to_s+"&sensor=false"
    return base_url+marker
  end
end
