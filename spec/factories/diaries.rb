FactoryBot.define do
  factory :diary do
    title {Faker::StarWars.character}
    body {Faker::Lorem.word}
    user_id {nil}
  end
end