FactoryGirl.define do
  factory :log do
    severity { [:info, :error].sample }
    message { Faker::Lorem.sentence }
    instance
  end
end
