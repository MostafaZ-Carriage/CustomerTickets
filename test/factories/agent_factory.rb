FactoryGirl.define do
  factory :agent do
    name 'Agent Name'
    email 'agent@agent.agent'
    password '123456789'
    factory :agent_with_tickets do
      transient do
        tickets_count 5
      end
      after(:create) do |agent, evaluator|
        create_list(:closed_ticket, evaluator.tickets_count, closer: agent)
      end
    end
  end
end