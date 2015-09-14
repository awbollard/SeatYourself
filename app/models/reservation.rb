class Reservation < ActiveRecord::Base

	validate :open_hours
	validate :max_party_size, on: :partysize

	belongs_to :user
	belongs_to :restaurant

	def open_hours
		unless dinner_time.hour <= restaurant.closing_time && dinner_time.hour >= restaurant.opening_time
			errors.add(:dinner_time, "This restaurant is not open during that time. Sorry :(")
		end
	end

	def max_party_size
		unless partysize <= 6 && partysize >= 1
			errors.add(:partysize, "We can't accomodate that party size, if you need to make a reservation for more than 6 people, please call us.")
		end
	end
end
