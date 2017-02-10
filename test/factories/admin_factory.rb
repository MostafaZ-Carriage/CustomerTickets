FactoryGirl.define do
  factory :admin do
    name 'Admin Name'
    email 'admin@admin.admin'
    password '123456789'
    type 'Admin'
    factory :admin_with_open_tickets do
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
        create_list(:ticket_admin_close, evaluator.tickets_count, closer: admin)
      end
    end
  end
end