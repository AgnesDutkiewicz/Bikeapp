class MonthlyService
  def monthly
    filtered_trips = Trip.where('date >= ?', 30.days.ago)

    grouped_trips = filtered_trips.sort_by { |t| t.date.day }.group_by { |t| t.date.day }

    grouped_trips.values.map do |trips|
      total_distance = 0
      total_price = 0
      date = nil

      trips.map do |trip|
        date = trip.date.strftime("%B, #{trip.date.day.ordinalize}")
        total_price += trip.price
        total_distance += trip.distance
      end

      avg_ride = total_distance / trips.count
      avg_price = total_price / trips.count

      total_distance = "#{total_distance} km"
      avg_ride = "#{avg_ride} km"
      avg_price = "#{avg_price} PLN"

      { day: date, total_distance: total_distance, avg_ride: avg_ride, avg_price: avg_price }
    end
  end
end
