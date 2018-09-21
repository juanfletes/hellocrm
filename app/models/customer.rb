class Customer < ApplicationRecord

  audited
  strip_attributes

  validates :name, presence: true,
                   length: { maximum: 1000 },
                   uniqueness: true

  validates :city, presence: true

  validates :direction, length: { maximum: 5000 }

  validates :observation, length: { maximum: 5000 }

  belongs_to :rel_city, class_name: 'Catalog', foreign_key: 'city', primary_key: 'code'

end
