class Trip < ApplicationRecord
  validates :start_address, presence: true
  validates :destination_address, presence: true
  validates :distance, presence: true
  validates :price, presence: true
  validates :date, presence: true

  geocoded_by :start_address
  geocoded_by :destination_address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode

  def address
    [street, city, country].compact.join(', ')
  end

  def location
    [latitude, longitude]
  end

  def set_location(latitude:, longitude:)
    update(latitude: latitude, longitude: longitude)
  end
end
