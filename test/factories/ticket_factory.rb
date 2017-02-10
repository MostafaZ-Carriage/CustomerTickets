FactoryGirl.define do
  factory :ticket do
    title 'I need a help!!'
    description 'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla'
    trait :customer_creates do
      association :creator, factory: :customer, strategy: :build
      creator_type 'Customer'
    end
    trait :admin_creates do
      association :creator, factory: :admin, strategy: :build
      creator_type 'Admin'
    end
    trait :agent_creates do
      association :creator, factory: :agent, strategy: :build
      creator_type 'Agent'
    end
    factory :closed_ticket do
      association :creator, factory: :customer, strategy: :build
      status TicketStatus::CLOSE
      association :closer, factory: :agent, strategy: :build
    end
    factory :ticket_customer, traits: [:customer_creates]
    factory :ticket_admin, traits: [:admin_creates]
    factory :ticket_agent, traits: [:agent_creates]
  end
end