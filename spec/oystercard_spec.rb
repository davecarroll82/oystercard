require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
    end

  it 'can be topped up' do
    expect{subject.top_up(10)}.to change {subject.balance}.by 10
    end

  it 'can reduce the balance' do
    expect{subject.spend(10)}.to change {subject.balance}.by -10
  end

describe "change balance" do
    it 'raise an error if max balance is reached' do
    expect{ subject.top_up(Oystercard::MAX_BALANCE + 1) }.to raise_error("Maximum balance of #{Oystercard::MAX_BALANCE} was exceeded")
    end
  end
end