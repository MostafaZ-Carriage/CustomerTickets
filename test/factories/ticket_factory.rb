# FactoryGirl.define do
#   factory :ticket do
#     title 'I need a help!!'
#     description 'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla'
#     trait :customer_creates do
#       association :creator, factory: :customer
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
#     factory :closed_ticket do
#       association :creator, factory: :admin_creates_customer, strategy: :build
#       creator_type 'Customer'
#       status TicketStatus::CLOSE
#       trait :customer_closes do
#         association :closer, factory: :admin_creates_customer, strategy: :build
#         closer_type 'Customer'
#       end
#       trait :admin_closes do
#         association :closer, factory: :admin, strategy: :build
#         closer_type 'Admin'
#       end
#       trait :agent_closes do
#         association :closer, factory: :admin_creates_agent, strategy: :build
#         closer_type 'Agent'
#       end
#       factory :ticket_customer_close, traits: [:customer_closes]
#       factory :ticket_admin_close, traits: [:admin_closes]
#       factory :ticket_agent_close, traits: [:agent_closes]
#     end
#
#     factory :ticket_customer, traits: [:customer_creates]
#     factory :ticket_admin, traits: [:admin_creates]
#     factory :ticket_agent, traits: [:agent_creates]
#   end
# end