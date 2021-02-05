FactoryBot.define do
  factory :item do
    title                { '商品名' }
    concept              { '商品紹介文' }
    price                { 5000 }
    category_id          { 3 }
    product_condition_id { 2 }
    shipping_charge_id   { 2 }
    shipping_area_id     { 2 }
    days_to_ship_id      { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user

  end
end
