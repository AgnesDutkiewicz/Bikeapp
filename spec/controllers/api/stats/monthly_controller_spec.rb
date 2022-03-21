RSpec.describe Api::Stats::MonthlyController, type: :request do
  subject(:fetch) { get '/api/stats/monthly' }

  context 'when there is no trips in current month' do
    it 'returns empty array' do
      fetch

      expect(parsed_body).to eq []
    end
  end

  context 'when there is one trip but not in current month' do
    before do
      Trip.create!(trip_attributes(date: '15-02-2022', distance: 15.42, price: 14.63))
    end

    it 'returns empty array' do
      fetch

      expect(parsed_body).to eq []
    end
  end

  context 'when there is one trip in current month' do
    before do
      Trip.create!(trip_attributes(date: '15-03-2022', distance: 15.42, price: 14.63))
    end

    it 'returns right values' do
      fetch

      expect(parsed_body).to eq [{ 'day' => '2022-03-15',
                                   'total_distance' => '15.42',
                                   'avg_ride' => '15.42',
                                   'avg_price' => '14.63' }]
    end
  end

  context 'when there are two trips but only one in current month' do
    before do
      Trip.create!(trip_attributes(date: '15-03-2022', distance: 15.42, price: 14.63))
      Trip.create!(trip_attributes(date: '15-02-2022', distance: 14.58, price: 15.37))
    end

    it 'returns right values' do
      fetch

      expect(parsed_body).to eq [{ 'day' => '2022-03-15',
                                   'total_distance' => '15.42',
                                   'avg_ride' => '15.42',
                                   'avg_price' => '14.63' }]
    end
  end

  context 'when there are two trips in current month with the dame date' do
    before do
      Trip.create!(trip_attributes(date: '15-03-2022', distance: 15.42, price: 14.63))
      Trip.create!(trip_attributes(date: '15-03-2022', distance: 14.58, price: 15.37))
    end

    it 'returns right values' do
      fetch

      expect(parsed_body).to eq [{ 'day' => '2022-03-15',
                                   'total_distance' => '30.0',
                                   'avg_ride' => '15.0',
                                   'avg_price' => '15.0' }]
    end
  end

  context 'when there are two trips in current month with different date' do
    before do
      Trip.create!(trip_attributes(date: '15-03-2022', distance: 15.42, price: 14.63))
      Trip.create!(trip_attributes(date: '17-03-2022', distance: 14.58, price: 15.37))
    end

    it 'returns right values' do
      fetch

      expect(parsed_body).to eq [{ 'day' => '2022-03-15',
                                   'total_distance' => '15.42',
                                   'avg_ride' => '15.42',
                                   'avg_price' => '14.63' },
                                 { 'day' => '2022-03-17',
                                   'total_distance' => '14.58',
                                   'avg_ride' => '14.58',
                                   'avg_price' => '15.37' }]
    end
  end
end

#  I dont know how to make spec with interactive date
