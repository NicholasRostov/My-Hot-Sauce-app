class ProductsController < ApplicationController
  

  def index
    @products = Product.all
    render "index.html.erb"
  end
  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price])
    @product.save
    flash[:succes] = "Your contact has been created!"
    redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price])
    @product.save
    flash[:info] = "Your contact has been updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "Contact has been deleted"
    redirect_to "/products"
  end
end
