require 'rails_helper'

describe 'Trip' do
  context 'when you try to create a trip' do
    it 'creates new trip if none data is blank' do
      t = Trip.new(trip_attributes)

      expect(t.save).to eq(true)
    end
    it 'fail to create trip if start_address is blank' do
      t = Trip.new(trip_attributes(start_address: nil))

      expect(t.save).to eq(false)
    end
    it 'fail to create trip if destination_address is blank' do
      t = Trip.new(trip_attributes(destination_address: nil))

      expect(t.save).to eq(false)
    end
    it 'fail to create trip if distance is blank' do
      t = Trip.new(trip_attributes(distance: nil))

      expect(t.save).to eq(false)
    end
    it 'fail to create trip if price is blank' do
      t = Trip.new(trip_attributes(price: nil))

      expect(t.save).to eq(false)
    end

    it 'fail to create trip when price is less than 0' do
      t = Trip.new(trip_attributes(price: -8.4))

      expect(t.save).to eq(false)
    end

    it 'fail to create trip if date is blank' do
      t = Trip.new(trip_attributes(date: nil))

      expect(t.save).to eq(false)
    end
  end
end
