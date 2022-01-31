require_relative '../lib/oystercard'

describe Oystercard do
  it 'should show money on a card' do
    expect(subject).to respond_to(:balance)
  end

  it 'should increase the balance by topup amount' do
    subject.topup(5)
    expect(subject.balance).to eq (5)
  end

  it 'should not allow the user to top up above £90' do
    subject.topup(Oystercard::MAXIMUM_CREDIT)
    expect{ subject.topup(5) }.to raise_error("Maximum balance #{Oystercard::MAXIMUM_CREDIT}")
  end

  # it 'should deduct the cost of the fare from the balance' do
  #   expect(subject).to respond_to(:deduct)
  # end

  it 'should decrease the balance by fare amount' do
    subject.topup(10)
    subject.touch_out
    expect(subject.balance).to eq (9)
  end

  it 'should check if in a journey' do
    expect(subject.in_journey?).to eq false
  end

  it 'should confirm that we are in a journey' do
    subject.topup(1)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'should confirm that we are no longer in a journey' do
    subject.topup(1)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "should a user touching in without the minimum balance" do
    expect{ subject.touch_in }.to raise_error("Minimum balance #{Oystercard::MINIMUM_BALANCE}")
  end

  it 'should deduct the minimum fare from the card' do
    subject.topup(1)
    subject.touch_in
    expect{ subject.touch_out }.to change { subject.balance }.by( -Oystercard::MINIMUM_BALANCE )
  end
end
