require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
  expect(subject.balance).to eq(0)
  end
end

# In order to use public transport
# As a customer
# I want money on my card