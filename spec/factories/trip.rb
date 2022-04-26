FactoryBot.define do
  factory :trip do
    start_address { 'fisrt address' }
    destination_address { 'second address' }
    distance { 14.34 }
    price { 26.99 }
    date { '30-03-2022' }
  end
end
