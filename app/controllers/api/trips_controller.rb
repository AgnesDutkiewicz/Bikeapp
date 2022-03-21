module Api
  class TripsController < ApiController
    def create
      @trip = Trip.new(trip_params)

      start_address_coordinates = Geocoder.coordinates(@trip.start_address)
      destination_coordinates = Geocoder.coordinates(@trip.destination_address)
      @trip.distance = Geocoder::Calculations.distance_between(start_address_coordinates, destination_coordinates)

      if @trip.save
        render json: @trip, status: :created
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end

    private

    def trip_params
      params.require(:trip).permit(:start_address, :destination_address, :price, :date)
    end
  end
end
