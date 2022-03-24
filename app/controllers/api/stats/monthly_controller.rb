module Api
  module Stats
    class MonthlyController < ApiController
      def index
        monthly_stats = []

        filtered_trips = Trip.where('date >= ?', 30.days.ago)

        grouped_trips = filtered_trips.sort_by { |t| t.date.day }.group_by { |t| t.date.day }

        grouped_trips.values.map do |trips|
          total_distance = 0
          total_price = 0
          date = nil

          trips.map do |trip|
            date = trip.date.strftime("%B, #{trip.date.day.ordinalize}")
            total_price = total_price.to_d + trip.price.to_d
            total_distance = total_distance.to_d + trip.distance.to_d
          end

          avg_ride = total_distance.to_d / trips.count
          avg_price = total_price.to_d / trips.count

          total_distance = "#{total_distance} km"
          avg_ride = "#{avg_ride} km"
          avg_price = "#{avg_price} PLN"

          monthly_stats << { day: date, total_distance: total_distance, avg_ride: avg_ride, avg_price: avg_price }
        end

        render json: monthly_stats
      end
    end
  end
end
