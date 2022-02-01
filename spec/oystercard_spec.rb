require_relative '../lib/oystercard'
# require_relative '../lib/station'

describe Oystercard do
  let (:station) { double :station }

  it 'should show money on a card' do
    expect(subject).to respond_to(:balance)
  end

  it 'should increase the balance by topup amount' do
    subject.topup(5)
    expect(subject.balance).to eq (5)
  end

  it 'should not allow the user to top up above maximum limit' do
    subject.topup(Oystercard::MAXIMUM_CREDIT)
    expect{ subject.topup(5) }.to raise_error("Maximum balance #{Oystercard::MAXIMUM_CREDIT}")
  end

  it 'should decrease the balance by minimum fare amount' do
    subject.topup(10)
    subject.touch_in(:station)
    subject.touch_out(:station)
    expect(subject.balance).to eq (9)
  end

  # it 'should check if in a journey' do
  #   expect(subject.in_journey?).to eq false
  # end

  # it 'should confirm that we are in a journey' do
  #   subject.topup(1)
  #   subject.touch_in(:station)
  #   expect(subject).to be_in_journey
  # end

  # it 'should confirm that we are no longer in a journey' do
  #   subject.topup(1)
  #   subject.touch_in(:station)
  #   subject.touch_out(:station)
  #   expect(subject).not_to be_in_journey
  # end

  it "should stop a user touching in without the minimum balance" do
    expect{ subject.touch_in(:station) }.to raise_error("Minimum balance #{Oystercard::MINIMUM_BALANCE}")
  end

  it 'should deduct the minimum fare from the card' do
    subject.topup(1)
    subject.touch_in(:station)
    expect{ subject.touch_out(:station) }.to change { subject.balance }.by( -Oystercard::MINIMUM_BALANCE )
  end

  # it 'should record the entry station of current journey' do
  #   subject.topup(1)
  #   subject.touch_in(:station)
  #   expect(subject.entry_station.length).to eq(1)
  # end

  # it 'should forget the entry station on touch out' do
  #   subject.topup(1)
  #   subject.touch_in(:station)
  #   expect{ subject.touch_out(:station) }.to change { subject.entry_station.length }.by( -1 )
  # end
  
  let(:journey){ {entry: :station, exit: :station}}
  it 'should record a list of all journeys' do
    subject.topup(1)
    subject.touch_in(:station)
    subject.touch_out(:station)
    expect(subject.history).to include journey
  end

  it 'should start with no journeys saved on card' do
    expect(subject.history.size).to be_zero
  end

end
