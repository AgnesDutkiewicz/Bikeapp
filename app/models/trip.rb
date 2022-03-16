class Trip < ApplicationRecord
  validates :start_address, presence: true
  validates :destination_address, presence: true
  validates :distance, presence: true
  validates :price, presence: true
  validates :date, presence: true
end
