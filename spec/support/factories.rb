require 'factory_girl'

FactoryGirl.define do

  def random_string(size)
    (0...size).map { ('a'..'z').to_a.sample }.join
  end

  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    title "1111111111222222222233333333344444444444"
    description "11111111112222222222333333333444444444445555555555"
    user
  end

  factory :answer do
    title "1111111111222222222233333333344444444444"
    body "11111111112222222222333333333444444444445555555555"
    user
  end


end
