FactoryBot.define do
  factory :user do
    email              {Faker::Internet.free_email}
    password           {Faker::Internet.password(min_length: 6)}
    nickname           {Faker::Name.initials(number: 2)}
    family_name        {'山田'}
    first_name         {'テスト'}
    family_name_kana   {'ヤマダ'}
    first_name_kana    {'テスト'}
    birthday           {'1930-01-01'}
    password_confirmation {password}
  end
end

