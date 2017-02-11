FactoryGirl.define do
  factory :agent do
    name 'Agent Name'
    email 'agent@agent.agent'
    password '123456789'
    type 'Agent'
    factory :internal_agent do
      email 'agent_internal@agent.agent'
    end
    factory :agent_with_tickets do
      association :creator, factory: :admin, strategy: :build
      creator_type 'Admin'
      transient do
        tickets_count 5
      end
      after(:create) do |agent, evaluator|
        create_list(:ticket_agent_close, evaluator.tickets_count, closer: agent,creator: create(:customer))
      end
    end
    trait :customer_creates do
      association :creator, factory: :customer, strategy: :build
      creator_type 'Customer'
    end
    trait :admin_creates do
      creator Admin.first
      creator_type 'Admin'
    end
    trait :agent_creates do
      association :creator, factory: :internal_agent, strategy: :build
      creator_type 'Agent'
    end
    trait :non_user_creates do

    end
    factory :customer_creates_agent, traits: [:customer_creates]
    factory :admin_creates_agent, traits: [:admin_creates]
    factory :agent_creates_agent, traits: [:agent_creates]
    factory :non_user_creates_agent, traits: [:non_user_creates]
  end
end