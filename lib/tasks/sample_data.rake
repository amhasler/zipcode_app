require 'csv'   

namespace :db do
  desc "Fill database with sample data"
	task populate: :environment do

		csv_text = File.read('db/seeds/zipcode.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			# This is a horrible hack that follows. I was spending too much time trying to figure out
			# why my rake task was getting stuck, and I needed to sanitize the data fast.
			# To do this well, I would do a lot more to actually go through the whole data set and clean
			# it up before adding it to the db, rather than just throwing out imperfect data.
			if row["state"] && row["state"].length == 2
		  	state = State.find_or_create_by!(abbrev:row["state"])
		  	if row["city"]
		  		city = state.cities.find_or_create_by!(name:row["city"])
		  		if row["zip"] && row["latitude"] && row["longitude"]
		  			zipcode = city.zipcodes.create!(zip:row["zip"],lat:row["latitude"],lon:row["longitude"])
		  		end
		  	end
		 	end
		end

	end
end