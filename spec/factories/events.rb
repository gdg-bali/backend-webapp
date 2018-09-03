FactoryBot.define do
  factory :event do
    transient do
      past { true }
    end

    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(7) }

    before(:create) do |event, evaluator|
      if evaluator.past
        event.start_at = Faker::Time.between(5.days.ago, 1.days.ago)
        event.end_at = event.start_at + 2.hours
      else
        event.start_at = Faker::Time.between(1.days.from_now, 5.days.from_now)
        event.end_at = event.start_at + 2.hours
      end
    end
  end
end
