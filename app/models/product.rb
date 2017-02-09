class Product < ApplicationRecord
  
  belongs_to :supplier
  has_many :photos
  has_many :orders, through: :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products

  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :description, length: { maximum: 500 }
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, messages:"Must be a price"}

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
