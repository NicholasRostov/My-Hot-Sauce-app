class ProductsController < ApplicationController
  

  def index
    @product = Product.all
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

    @product = Product.new(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price])
    render "create.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price])
    @product.save
    render "update.html.erb"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render "destroy.html.erb"
  end
end
