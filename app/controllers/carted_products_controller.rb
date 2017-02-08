class CartedProductsController < ApplicationController
  def create
    order = CartedProduct.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id])
    order.status = "carted"
    order.save
    redirect_to "/cart"
  end

  def index
     @cartedproducts = if current_user.carted_prodcuts.where(status:"carted")
      if carted_products.any?
        render "index.html.erb"
      else
        redirect_to "/"
      end
    end
  end
end
