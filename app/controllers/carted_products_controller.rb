class CartedProductsController < ApplicationController
  def create
    order = CartedProduct.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id])
    order.status = "carted"
    order.save
    redirect_to "/cart"
  end

  def index
    if current_user.carted_prodcuts.where(status:"") == []

    @cartedproducts = CartedProduct.all.where(status: "carted")
    else "redirect_to"
    end
  end
end
