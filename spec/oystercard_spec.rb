require 'Oystercard'

describe OysterCard do

	it "shows the initial balance of the card at 0" do
		expect(subject.balance).to eq 0
	end

	it "should top up the card by a value" do
		number = 2.to_f
		expect(subject.top_up(number)).to eq "your oyster card has been topped up by £#{number.to_f}"
		end
	end

