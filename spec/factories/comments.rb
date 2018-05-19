FactoryBot.define do
  factory :comment do
    content "My comment"
    association :article
    association :user
  end
end
