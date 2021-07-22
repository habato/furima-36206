FactoryBot.define do
  factory :order_address do
    postal_code    { '123-4567' }
    prefectures_id { 14 }
    municipality   { '東京都' }
    address        { '1-1' }
    building_name  { '東京ハイツ' }
    phone_number   { '09012345678' }
  end
end