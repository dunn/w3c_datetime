require 'minitest/autorun'
require 'w3c_datetime'

describe W3cDatetime do
  it 'does not parse rubbish and invalid dates' do
    assert_raises ArgumentError do
      W3cDatetime.parse('ala ma kota')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2012-03-20 ala ma kota')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('sth stupid2012-03-20')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2012-03-20T99:00:99')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2012-13-20')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2012-12-20T10:10+25:00')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('194-02-28')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('194')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('1940-2')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('1940-2-28')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('1940-02-2')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('1940-2-2')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2/28/1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28/2/1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2-28-1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28-2-1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2-2-1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('February 28, 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('Feb 28, 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28 February 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28 Feb 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('Feb. 28, 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28 Feb. 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('February 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('Feb. 1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('1940 February')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('1940 Feb.')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('1940-02-30')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('02/28/1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28/02/1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('2/28/40')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28/2/40')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('02-28-1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('28-02-1940')
    end

    assert_raises ArgumentError do
      W3cDatetime.parse('02-02-1940')
    end
  end

  it 'returns DateTime object' do
    W3cDatetime.parse('2013-02-10').must_be_instance_of DateTime
  end

  it 'parses date' do
    W3cDatetime.parse('2013-02-10').must_equal DateTime.new(2013, 0o2, 10)
  end

  it 'parses date with hour and minute' do
    W3cDatetime.parse('2013-02-10T10:10').must_equal DateTime.new(2013, 0o2, 10, 10, 10)
  end

  it 'parses date with time' do
    W3cDatetime.parse('2013-02-10T10:10:20').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 20)
  end

  it 'parses date with time and timezone' do
    W3cDatetime.parse('2013-02-10T10:10:20+10:00').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 20, '+10:00')
  end

  it 'parses date with time and Zulu offset' do
    W3cDatetime.parse('2013-02-10T10:10:20Z').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 20, '+00:00')
  end

  it 'parses date with time and miliseconds' do
    W3cDatetime.parse('2013-02-10T10:10:20.30').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 20)
  end

  it 'parses date with hour and minute and offset' do
    W3cDatetime.parse('2013-02-10T10:10+10:30').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 0, '+10:30')
  end

  it 'parses date with time and offset' do
    W3cDatetime.parse('2013-02-10T10:10:10+10:30').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 10, '+10:30')
  end

  it 'parses date with time and miliseconds and offset' do
    W3cDatetime.parse('2013-02-10T10:10:10.30+10:30').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 10, '+10:30')
  end

  it 'parses date with time and miliseconds and Zulu offset' do
    W3cDatetime.parse('2013-02-10T10:10:10.30Z').must_equal DateTime.new(2013, 0o2, 10, 10, 10, 10, '+00:00')
  end
end
