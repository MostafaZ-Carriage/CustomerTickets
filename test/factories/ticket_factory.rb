FactoryGirl.define do
  factory :ticket do
    title 'I need a help!!'
    description 'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla'
    association :creator, factory: :customer, strategy: :build
    factory :closed_ticket do
      status TicketStatus::CLOSE
      association :closer, factory: :agent, strategy: :build
    end
  end
end