class ProductsController < ApplicationController
  

  def index
    sale = params[:sale]
    sort_attribute = params[:sort]
    @products = Product.all
    if sort_attribute && params[:order]
    @products = Product.all.order(sort_attribute => params[:order])
    elsif sale
    @products = Product.where("price <?", 2)  
      
  end

    
    render "index.html.erb"
  end
  def show
    if params[:id] == "random"
    @product = Product.all.sample
  else
    @product = Product.find_by(id: params[:id])
  end
      render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price], supplier_id: params[:supplier_id])
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

  def one
    @first = Photo.first()
  end
end
