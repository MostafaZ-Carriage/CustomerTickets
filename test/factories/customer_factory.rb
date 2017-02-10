FactoryGirl.define do
  factory :customer do
    name 'Customer Name'
    email 'customer@customer.customer'
    password '123456789'
    type 'Customer'
    factory :customer_with_tickets do
      transient do
        tickets_count 5
      end
      after(:create) do |customer, evaluator|
        create_list(:ticket, evaluator.tickets_count, creator: customer)
      end
    end
  end
end