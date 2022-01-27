require 'station'

describe Station do

  subject{described_class.new(name:'Manchester', zone:2)}
  
  it 'has a name' do
  expect(subject.name).to eq 'Manchester'
  end

  it 'has a zone' do
  expect(subject.zone).to eq 2
  end
end