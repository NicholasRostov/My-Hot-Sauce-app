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
  (price[1..-1].to_f * 0.09).round(2)
  end

  def total
    tax + price[1..-1].to_f
  end
end
