FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    birth_date { Faker::Date.birthday }
    last_name { '山田' } 
    first_name { '太郎' }  
    last_name_kana { 'ヤマダ' } 
    first_name_kana { 'タロウ' }  
  end
end