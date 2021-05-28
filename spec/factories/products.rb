FactoryBot.define do
  factory :product do
    name {"バナナ"}
    deadline {Date.today}
    association :user
  end
end