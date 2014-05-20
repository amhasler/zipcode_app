class State < ActiveRecord::Base
	has_many :cities

	validates :abbrev, presence: true, length: { is: 2 }
end
