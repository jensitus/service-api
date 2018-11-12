FactoryBot.define do
  factory :user do
    id { Faker::IDNumber }
    name { Faker::Name.name }
    email { Faker::Internet.email } #'foo@bar.com'
    password { 'foobar' }
  end

  # factory :user_for_list do
  #   name { Faker::Name.name }
  #   #email 'foo@bar.com'
  #   #sequence(:email, 10) { |n| "user#{n}@someplace.local"}
  #   email 10.times.map { Faker::Internet.email }
  #   password 'foobar'
  # end

end