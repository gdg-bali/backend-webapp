FactoryBot.define do
  factory :session do
    name { Faker::Lorem.word }
    duration { 30 }
    session_type { 'Talks' }
    user
  end
end
