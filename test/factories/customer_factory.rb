# FactoryGirl.define do
#   factory :customer do
#     name 'Customer Name'
#     email 'customer@customer.customer'
#     password '123456789'
#     type 'Customer'
#     factory :internal_customer do
#       email 'customer_internal@customer.customer'
#     end
#     factory :customer_with_tickets do
#       association :creator, factory: :admin, strategy: :build
#       creator_type 'Admin'
#       transient do
#         tickets_count 5
#       end
#       after(:create) do |customer, evaluator|
#         create_list(:ticket, evaluator.tickets_count, creator: customer)
#       end
#     end
#     trait :customer_creates do
#       association :creator, factory: :internal_customer, strategy: :build
#       creator_type 'Customer'
#     end
#     trait :admin_creates do
#       association :creator, factory: :admin, strategy: :build
#       creator_type 'Admin'
#     end
#     trait :agent_creates do
#       association :creator, factory: :admin_creates_agent, strategy: :build
#       creator_type 'Agent'
#     end
#     factory :customer_creates_customer, traits: [:customer_creates]
#     factory :admin_creates_customer, traits: [:admin_creates]
#     factory :agent_creates_customer, traits: [:agent_creates]
#   end
# end