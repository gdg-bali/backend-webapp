FactoryBot.define do
  factory :event do
    transient do
      past { true }
    end

    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(7) }
    slug_url { Faker::Lorem.word }

    venue

    before(:create) do |event, evaluator|
      if evaluator.past
        event.starts_at = Faker::Time.between(5.days.ago, 1.days.ago)
        event.ends_at = event.starts_at + 2.hours
      else
        event.starts_at = Faker::Time.between(1.days.from_now, 5.days.from_now)
        event.ends_at = event.starts_at + 2.hours
      end
    end
  end
end
