FactoryBot.define do
  factory :item do
    association :user

    title { Faker::Name.name }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    situation_id { Faker::Number.between(from: 1, to: 6) }
    load_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    delivery_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }


    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'test_image.png')) }

  end
end

