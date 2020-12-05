FactoryBot.define do
  factory :bookmark do
    bookmark {Faker::StarWars.character}
    description {Faker::Lorem.word}
    user_id {nil}
  end
end