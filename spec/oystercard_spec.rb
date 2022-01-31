require_relative '../lib/oystercard'

describe Oystercard do
 it 'should show money on a card' do
  expect(subject).to respond_to(:balance)
 end
end
