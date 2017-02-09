class ProductsController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authenticate_admn!, except: [:index, :show]
  def index
    sale = params[:sale]
    sort_attribute = params[:sort]
    @products = Product.all
    if sort_attribute && params[:order]
    @products = Product.all.order(sort_attribute => params[:order])
    elsif sale
    @products = Product.where("price <?", 2)  
    elsif params[:category]
      category_name = params[:category]
      selected_category = Category.find_by(name: params[:category])
      @products = selected_category.products
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
    @product = Product.new
    render "new.html.erb"
  end

  def create
    @product = Product.new(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price], supplier_id: params[:supplier_id])
    if @product.save
      @product.photos.create(url: params[:url])
    flash[:succes] = "Your product has been created!"
    redirect_to "/products/#{@product.id}"
    else
      flash[:error] = "You stupid"
    render "new.html.erb"
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price])
    if @product.save
      flash[:succes] = "Yayyy it has been updated"
      redirect_to "edit.html.erb"
    else
      flash[:error] = "Stop Hammer time!"
    render "/products/#{@product.id}"
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "Product has been deleted"
    redirect_to "/products"
  end

  def one
    @first = Photo.first()
  end
end
