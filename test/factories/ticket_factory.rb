FactoryGirl.define do
  factory :ticket do
    title 'I need a help!!'
    description 'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla'
    association :creator, factory: :customer
  end
end