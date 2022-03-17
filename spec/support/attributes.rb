def trip_attributes(overrides = {})
  {
    start_address: '1 adres',
    destination_address: '2 adres',
    distance: 15.00,
    price: 6.31,
    date: 'May, 15'
  }.merge(overrides)
end
