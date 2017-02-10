FactoryGirl.define do
  factory :agent do
    name 'Agent Name'
    email 'agent@agent.agent'
    password '123456789'
    type 'Agent'
    factory :agent_with_tickets do
      transient do
        tickets_count 5
      end
      after(:create) do |agent, evaluator|
        create_list(:ticket_agent_close, evaluator.tickets_count, closer: agent)
      end
    end
  end
end