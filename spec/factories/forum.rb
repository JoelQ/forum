FactoryGirl.define do
 factory :category do
   name 'Ruby on Rails'
 end

 factory :topic do
   name 'Integration Testing'
   content 'A vital part of the TDD experience ... blah blah blah'
   category
 end
end
