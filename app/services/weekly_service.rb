class WeeklyService
  def weekly
    chosen_trips = Trip.where('date >= ?', 1.week.ago)

    w_distance = 0
    price = 0

    chosen_trips.each do |t|
      w_distance = w_distance.to_d + t.distance.to_d
      price = price.to_d + t.price.to_d
    end

    w_distance = "#{w_distance} km"
    price = "#{price} PLN"

    { total_distance: w_distance, total_price: price }
  end
end
