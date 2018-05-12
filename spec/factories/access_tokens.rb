FactoryBot.define do
  factory :access_token do
    #token is generated after initialization
    association :user
  end
end
