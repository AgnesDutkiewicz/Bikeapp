RSpec.describe Api::TripsController, type: :request do
  describe 'trips#create' do
    subject(:create_trip) { post "/api/trips", params: params }

    let(:trip) { Trip.create!(trip_attributes(start_address: 'Potrzebna 32, Warszawa, Polska', destination_address: 'Skierniewicka 21, Warszawa, Polska', date: '20-03-2022')) }
    let(:params) do
      { trip: {trip_id: trip.id }}
    end

    it 'creates new trip' do
      expect { create_trip }
        .to change { Trip.count }
              .from(0)
              .to(1)
    end
  end
end

