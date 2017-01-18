class ProductsController < ApplicationController
  
  def first_sauce
  @sauce = Product.first
  render "hotsauce_display.html.erb"
  end
end
