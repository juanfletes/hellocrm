FactoryBot.define do
  factory :user do
    email { 'user@devel.com' }
    password { 'tmp123456' }
    password_confirmation { 'tmp123456' }
  end

  factory :catalog, class: Catalog do
    code { 'A01' }
    name { 'test Catalog' }
    description { 'test description for catalog' }
    active { true }
  end

end
