require 'oystercard'

describe Oystercard do
  let (:entry_station){ double :station }
  let (:exit_station){double :station}

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
    end

  it 'can be topped up' do
    expect{subject.top_up(10)}.to change {subject.balance}.by 10
    end

  it 'is initially not in a journey' do
  expect(subject).not_to be_in_journey
  end

  it 'can check cards balance for sufficient funds' do
    expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient funds to touch in" 
  end

  it 'checks the journey list is empty' do
    expect(subject.journey_list).to be_empty
  end

  context 'when card has balance' do
  before do
  subject.top_up(5)
  end

  it 'stores the entry station' do
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end

  it 'stores the exit station' do
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end

  it 'can touch in' do
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject).not_to be_in_journey
  end

  it 'can charge when touch out' do
  subject.touch_in(entry_station)
  expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MIN_BALANCE)
  end

  it 'creates one journey' do
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journey_list).to eq ([{:entry_station=>entry_station, :exit_station=>exit_station}])
  end
end

describe "change balance" do
    it 'raise an error if max balance is reached' do
    expect{ subject.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error("Maximum balance of #{Oystercard::MAX_BALANCE} was exceeded")
    end
  end
end