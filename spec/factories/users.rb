FactoryBot.define do
  factory :user do
    name                  { 'testname' }
    email                 { 'kkk@gmail.com' }
    password              { 's1111111' }
    password_confirmation { 's1111111' }
  end
end


