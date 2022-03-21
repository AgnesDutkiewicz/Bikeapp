module Api
  module Stats
    class MonthlyController < ApiController
      def index
        x = []

        filtered_trips = Trip.where('date >= ?', 30.days.ago)

        grouped_trips = filtered_trips.sort_by{ |t| t.date }.group_by{ |t| t.date.day}

        grouped_trips.values.map { |trips|
          trips.map do |trip|
            @date = trip.date.to_date
            @total_price = @total_price.to_d + trip.price.to_d
            @avg_price = @total_price.to_d / trips.count
            @total_distance = @total_distance.to_d + trip.distance.to_d
            @avg_ride = @total_distance.to_d / trips.count
          end

          x << { day: @date, total_distance: @total_distance, avg_price: @avg_price, avg_ride: @avg_ride }

          @total_distance = 0
          @total_price = 0
        }

        # @x <<  { day: date, total_distance: total_distance, avg_price: avg_price, avg_ride: avg_ride }
        # pp x.values.map { |items| pp items.count }
        render json: x
      end
    end
  end
end

# Things i would do better/different if I had more time:
# I would change trip.date to be data not datetime in database
