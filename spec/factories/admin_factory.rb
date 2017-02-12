FactoryGirl.define do
  factory :admin do
    name 'Admin Name'
    email 'admin_first@admin.admin'
    password '123456789'
    type 'Admin'
    creator Admin.first
    creator_type 'Admin'
    factory :admin_with_created_tickets do
      transient do
        tickets_count 5
      end
      after(:create) do |admin, evaluator|
        create_list(:ticket, evaluator.tickets_count, creator: admin)
      end
    end
    factory :admin_with_closed_tickets do
      transient do
        tickets_count 5
      end
      after(:create) do |admin, evaluator|
        create_list(:ticket_admin_close, evaluator.tickets_count, closer: admin, creator: create(:customer))
      end
    end
    trait :customer_creates do
      association :creator, factory: :customer, strategy: :build
      creator_type 'Customer'
    end
    trait :agent_creates do
      association :creator, factory: :agent, strategy: :build
      creator_type 'Agent'
    end
    trait :non_user_creates do

    end
    factory :customer_creates_admin, traits: [:customer_creates]
    factory :agent_creates_admin, traits: [:agent_creates]
    factory :non_user_creates_admin, traits: [:non_user_creates]
  end
end