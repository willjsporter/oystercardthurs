
class OysterCard
	
	attr_reader :balance

	def initialize 
		@balance = 0
	end

	def top_up (value)
		@balance += value.to_f
		"your oyster card has been topped up by #{value.to_f}"
	end

end