require 'minitest/autorun'
require 'w3c_datetime'

describe DateTime do
  describe '#to_w3c_datetime' do
    it 'should return string representing time in W3C date time format' do
      t = DateTime.new

      t.must_be_within_delta W3cDatetime.parse(t.to_w3c_datetime), 1
    end
  end
end
