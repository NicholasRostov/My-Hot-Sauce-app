class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    @order = Order.new(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id], subtotal: (product.price * params[:quantity].to_d), tax: (product.tax * params[:quantity].to_d), total: (product.total * params[:quantity].to_d))
    @order.save
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end

end
