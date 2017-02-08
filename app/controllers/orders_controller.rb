class OrdersController < ApplicationController
  def create
    carted_product = current_user.carted_products.where(status: "carted")
    order = Order.new(user_id: current_user.id) 
    order.save
    order.confirm_order(carted_product)
    order.find_absolute_total
    redirect_to "/orders/#{order.id}"
    
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end

end
