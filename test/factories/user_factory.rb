# FactoryGirl.define do
#   factory :user do
#     name 'User Name'
#     email 'user@user.user'
#     password '123456789'
#     type nil
#     trait :customer_creates do
#       association :creator, factory: :customer, strategy: :build
#       creator_type 'Customer'
#     end
#     trait :admin_creates do
#       association :creator, factory: :admin, strategy: :build
#       creator_type 'Admin'
#     end
#     trait :agent_creates do
#       association :creator, factory: :agent, strategy: :build
#       creator_type 'Agent'
#     end
#     trait :non_user_creates do
#
#     end
#     factory :customer_creates_user, traits: [:customer_creates]
#     factory :admin_creates_user, traits: [:admin_creates]
#     factory :agent_creates_user, traits: [:agent_creates]
#     factory :non_user_creates_user, traits: [:non_user_creates]
#   end
# end