class Catalog < ApplicationRecord

  audited
  strip_attributes

  validates :code, presence: true,
                   length: { maximum: 10 },
                   uniqueness: true,
                   format: { with: /\A([a-zA-Z0-9]{1,10})\z/ }

  validates :parent_code, length: { maximum: 10 },
                          format: { with: /\A([a-zA-Z0-9]{1,10})\z/,
                                    allow_nil: true }

  validates :name, presence: true,
                   length: { maximum: 250 },
                   uniqueness: true,
                   format: { with: /\A([a-zA-Z 0-9]{1,250})\z/ }

  validates :description, length: { maximum: 500 }

  belongs_to :rel_catalog, class_name: 'Catalog',
                           foreign_key: 'parent_code',
                           primary_key: 'code',
                           optional: true

  has_many :rel_customer, class_name: 'Customer',
                          foreign_key: 'city',
                          primary_key: 'code'

end
