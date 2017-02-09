  class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products

  validates :subtotal, :tax, :total, greater_than: 0


  def sub_tot
    self.subtotal = 0
    carted_products.each do |cartedproduct|
    self.subtotal += cartedproduct.product.price.to_i * cartedproduct.quantity
  end
    end

  def find_tax
    self.tax = subtotal * 0.09
  end
    
  def find_total
    self.total = tax + subtotal
  end

  def find_absolute_total
    sub_tot
    find_tax
    find_total
    save
  end

  def confirm_order(input_carted_product)
    input_carted_product.each do|cartedproduct|
      cartedproduct.status = "purchased" 
      cartedproduct.order_id = id
      cartedproduct.save
    end
  end

end
