
class OysterCard

	attr_reader :balance

	MAX_BALANCE = 90

	def initialize
		@balance = 0
	end

	def top_up(value)
		raise "Maximum balance exceeded" if value + @balance > MAX_BALANCE
		@balance += value.to_f
		"your oyster card has been topped up by £#{value.to_f}"
	end

end
