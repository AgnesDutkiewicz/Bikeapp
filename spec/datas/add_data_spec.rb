require 'rails_helper'

describe 'Trip' do
  it 'creates new trip if none data is blank' do
    t = Trip.new(trip_attributes)

    expect(t.save).to eq(true)
  end
  it 'isnt save if start_address is blank' do
    t = Trip.new(trip_attributes(start_address: nil))

    expect(t.save).to eq(false)
  end
  it 'isnt save if destination_address is blank' do
    t = Trip.new(trip_attributes(destination_address: nil))

    expect(t.save).to eq(false)
  end
  it 'isnt save if distance is blank' do
    t = Trip.new(trip_attributes(distance: nil))

    expect(t.save).to eq(false)
  end
  it 'isnt save if price is blank' do
    t = Trip.new(trip_attributes(price: nil))

    expect(t.save).to eq(false)
  end
  it 'isnt save if date is blank' do
    t = Trip.new(trip_attributes(date: nil))

    expect(t.save).to eq(false)
  end
end
