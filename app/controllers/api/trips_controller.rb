module Api
  class TripsController < ApiController
    def create
      @trip = Trip.new(trip_params)

      if @trip.save
        render json: @trip, status: :created
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end

    private

    def trip_params
      # remember to change this so distance is calculated by geokit
      params.require(:trip).permit(:start_address, :destination_address, :price, :distance, :date)
    end
  end
end
