FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    username 'user@example.com'
    password "password"
    roles ['user']
  end

end
