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
end
