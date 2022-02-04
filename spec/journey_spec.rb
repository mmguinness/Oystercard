require_relative '../lib/journey'
require_relative '../lib/oystercard'

describe Journey do

  it 'should start a journey' do
    expect(subject.active).to eq true
  end

  it 'should end a joureny' do
    subject.finish
    expect(subject.active).to eq false
  end

  it 'should calculate the fare' do
    
    expect(subject.fare).to eq(Oystercard::MINIMUM_BALANCE)
  end

  it 'should confirm if journey is not complete' do
    expect{ subject.new_journey.new_journey }.to raise_error("Journey in progress!")
  end
end
