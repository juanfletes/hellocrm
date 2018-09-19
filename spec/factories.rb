FactoryBot.define do
  factory :user do
    email { 'user@devel.com' }
    password  { 'tmp123456' }
    password_confirmation { 'tmp123456' }
  end
end
