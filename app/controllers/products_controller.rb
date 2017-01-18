class ProductsController < ApplicationController
  
  def first_sauce
  @sauce = Product.first
  render "hotsauce_display.html.erb"
  end

  def all_sauce
    @allsauce = Product.all
    render "all_hotsauces.html.erb"
  end
end
