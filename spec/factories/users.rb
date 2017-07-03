FactoryGirl.define do
  factory :user do
    email                 "fake@example.com"
    password              "helloworld"
    password_confirmation "helloworld"
    confirmed_at          { Time.now }
  end
end
