class Customer < ApplicationRecord

  audited
  strip_attributes

  validates :name, presence: true,
                   length: { maximum: 1000 },
                   uniqueness: true

  validates :direction, length: { maximum: 5000 }

  validates :direction, length: { maximum: 5000 }

end
