FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    created_by { nil }
    user_id {nil}
  end
end