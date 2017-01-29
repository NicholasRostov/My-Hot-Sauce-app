class Product < ApplicationRecord
  def time
    created_at.strftime("%b %d, %Y")
  end

  def sale_massage
    if price.to_i < 2
      return "Discount massage!"
    else 
      return "Everyday value massage!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end
end
