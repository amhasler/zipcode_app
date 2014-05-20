class Zipcode < ActiveRecord::Base
	belongs_to :city

	validates :zip, presence: true, length: {is: 5}
	validates_presence_of :lat
	validates_presence_of :lon
	validates_presence_of :city_id

	def self.search_by_zip(zip)

	end

	def self.search_by_latlon(lat, lon)

	end

end
