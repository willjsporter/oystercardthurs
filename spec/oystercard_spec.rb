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
    top_up = OysterCard::DEFAULT_TOP_UP_AMOUNT
    subject.top_up(top_up)
    # allow(card).to receive(:top_up).and_return(10.0)
    expect(subject.send(:deduct, 3)).to eq 2
  end

  it { is_expected.to respond_to(:tap_in) }
  it { is_expected.to respond_to(:tap_out) }
  it { is_expected.to respond_to(:in_use?) }

  it 'will touch the customer in' do
    top_up = OysterCard::DEFAULT_TOP_UP_AMOUNT
    subject.top_up(top_up)
    expect(subject.tap_in).to eq 'You have tapped in'
  end

  it 'will touch the customer out' do
    expect(subject.tap_out).to eq -5
  end

  it 'expects to tell me whether the card is in use?' do
    top_up = OysterCard::DEFAULT_TOP_UP_AMOUNT
    subject.top_up(top_up)
    subject.tap_in
    expect(subject.in_use?).to eq true
  end

  it "Raises an error if there is not enough money" do
    expect { subject.tap_in }.to raise_error "Sorry, you don't have enough money! please top-up!"
  end
  it "removes an amount from the balance" do
    subject.top_up(20)
  expect { subject.tap_out }.to change { subject.balance }.by -5
end
end

