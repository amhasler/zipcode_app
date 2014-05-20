class Zipcode < ActiveRecord::Base
	belongs_to :city

	#validates :zip, presence: true, length: {is: 5}
	validates_presence_of :lat
	validates_presence_of :lon
	validates_presence_of :city_id

	def self.search_by_zip(query)
		#create an array of the values for the response, with
		#latitude and longitude its own array just for the sake
		#of grouping like things together
		zipcode = Zipcode.find_by_zip(query)
		response = [zipcode.city.name, [zipcode.lat.to_s,zipcode.lon.to_s]]
		return response
	end

	def self.search_by_latlon(lat, lon, n)
		city_and_zip = []
		# This is unquestionably a terrible algorithm. The right algorithm would
		# Make comparisons by looking at the closet values first, and spreading out from 
		# there. In this instance, the query would just as likely start mining for 
		# information between points in California and Rhode Island.

		# I need to create a sorted list here, first and foremost. After all, what if 
		# Someone requests 40000 records?
		list = Zipcode.all
	  (1..list.length - 1).each do |i|
	    dist = GeoDistance::Haversine.geo_distance( lon, lat, list[i].lon, list[i].lat)

	    j = i - 1
	    while j >= 0 && list[j] > value do
	      list[j + 1] = list[j]
	      j -= 1
	    end
	    list[j + 1] = value
	  end

	  n.times do |i|
	  	city_and_zip << [list[i].city, list[i].zip]
	  end
		return city_and_zip
	end

end
