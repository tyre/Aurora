require 'net/http'
require 'json'
require 'awesome_print'
require_relative "Location.rb"

class Step
	attr_reader :orig, :dest, :dist, :dist_str, :dur, :dur_str, :html_inst
	def initialize(orig, dest, dist, dist_str, dur, dur_str, html_inst)
		@orig = orig #start location
		@dest = dest #end location
		@dist = dist.to_f.round(1) #distance (meters)
		@dist_str = dist_str.to_s #human readable dist (feet/mi)
		@dur = dur.to_i #time (seconds)
		@dur_str = dur_str.to_s #human readable instructions
		@html_inst = html_inst #human readable instructions
	end

	def to_s
		ap html_inst + " Dist: " + @dist_str + " Time:" + dur_str + "."
	end
end

class Trip
	attr_accessor :fare
	attr_reader :origin, :destination, :steps, :total_dist, :total_time, :vehicle, :package
	def initialize(origin, destination, vehicle, package)
		if origin.is_a? Location
			@origin = origin
		else
			raise "origin (param 1) must be of type Location, homeboy!"
		end
		if destination.is_a? Location
			@destination = destination
		else
			raise "destination (param 2) must be of type Location, homeboy!"
		end
		@total_time = 0
		@total_dist = 0
		@steps = Array.new()
		@vehicle = vehicle
		@package = package #num people for taxi or food order for delivery
		calc_dirs()

	end

	def calc_dirs
		base_url = "http://maps.googleapis.com/maps/api/directions/json?"
		orig = "origin=" + @origin.lat.to_s + "," + @origin.long.to_s
		dest = "destination=" + @destination.lat.to_s + "," + @destination.long.to_s
		url = base_url + orig + "&" + dest + "&sensor=false"

		response = Net::HTTP.get_response(URI.parse(url))
		result = JSON.parse(response.body)

		result["routes"][0]["legs"][0]["steps"].each do |s|
			o = Location.new(s["start_location"]["lat"],s["start_location"]["lng"])
			d = Location.new(s["end_location"]["lat"],s["end_location"]["lng"])
			dist = s["distance"]["value"].to_i
			@total_dist += dist
			dist_str = s["distance"]["text"]
			dur = s["duration"]["value"].to_i
			@total_time += dur
			dur_str = s["duration"]["text"]
			html = s["html_instructions"]
			@steps << Step.new(o,d,dist,dist_str,dur,dur_str,html)
		end
	end

	def to_s
		ap @steps.each
		ap "Total time: " + total_time.to_s + "seconds."
		ap "Total Distance: " + total_dist.to_s + " meters."
	end
end