# frozen_string_literal: true

FactoryBot.define do

  factory :user do
    email 'email@email.com'
    password '123456'
  end

  factory :post do
    title 'Test'
    body 'This is the body'
  end

  factory :comment do
    body 'This is the body'
  end

end
