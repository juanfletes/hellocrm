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

  factory :cat_country_ni, class: Catalog do
    code { 'NI' }
    name { 'NICARAGUA' }
    active { true }
  end

  factory :cat_city_managua, class: Catalog do
    code { 'MNG' }
    association :rel_catalog, factory: :cat_country_ni, strategy: :build
    name { 'MANAGUA' }
    active { true }
  end

  factory :customer do
    name { 'Name of customer' }
    association :rel_city, factory: :cat_city_managua, strategy: :build
    direction { 'direction of customer' }
    observation { 'this is a good customer' }
    active { true }
  end

end
