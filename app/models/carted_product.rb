class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  validates :quantity, :only_integer, greater_than: 0
  validates :quantity, presence: true
  # validates  status "carted", "purchased", "removed"
  validates :user_id, :product_id, greater_than: 0, presence: true

end
