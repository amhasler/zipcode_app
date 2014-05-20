class City < ActiveRecord::Base

	has_many :zipcodes
	belongs_to :state

	validates :name, presence: true, length: { maximum: 40 }

end
