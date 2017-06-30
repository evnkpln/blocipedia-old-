FactoryGirl.define do
  factory :user do
    email                 "kalis45@hotmail.com"
    password              "helloworld"
    password_confirmation "helloworld"
    confirmed_at          { Time.now }
  end
end
