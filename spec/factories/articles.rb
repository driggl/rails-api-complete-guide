FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "My awesome article #{n}" }
    sequence(:content) { |n| "The content of my awesome article #{n}" }
    sequence(:slug) { |n| "my-awesome-article-#{n}" }
  end
end
