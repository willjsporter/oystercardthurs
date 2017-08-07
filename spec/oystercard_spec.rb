require 'Oystercard'

describe OysterCard do
  it 'shows the initial balance of the card at 0' do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'should top up the card by a value' do
    number = 2.to_f
    expect(subject.top_up(number)).to eq "your oyster card has been topped up by £#{number.to_f}"
  end

  # it "will raise an error if topup will take the balance above 90" do
  #   allow(subject).to receive(:balance).and_return(90)
  # 	expect{(subject.top_up(1))}.to raise_error "Maximum balance exceeded"
  # end

  it 'will raise an error if topup will take the balance above 90' do
    maximum_balance = OysterCard::MAX_BALANCE
    subject.top_up(maximum_balance)
    expect { subject.top_up(0.1) }.to raise_error 'Maximum balance exceeded'
  end

  it 'will deduct an amount of money from the balance' do
    subject.top_up(20)
    # allow(card).to receive(:top_up).and_return(10.0)
    expect(subject.deduct(5)).to eq 15
  end

	it { expect(subject).to respond_to(:in_journey?) }

	it "is initially not in a journey" do
		expect(subject.in_journey?). to be_falsey
	end


end
