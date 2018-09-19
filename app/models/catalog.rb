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

end
