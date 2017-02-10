FactoryGirl.define do
  factory :user do
    name 'User Name'
    email 'user@user.user'
    password '123456789'
    type 'User'
  end
end