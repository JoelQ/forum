FactoryGirl.define do
 factory :category do
   name 'Ruby on Rails'
 end

 factory :topic do
   category
   user
   name 'Integration Testing'
   content 'A vital part of the TDD experience ... blah blah blah'
 end

 factory :post do
   user
   topic
   content 'I totally agree. Nice job!'
 end

 factory :category_role do
   user
   category
   banned false
   moderator false
 end
end
