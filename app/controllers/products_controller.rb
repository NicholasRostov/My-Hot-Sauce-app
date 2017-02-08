class ProductsController < ApplicationController
  

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
    if current_user.admn?
    render "new.html.erb"
    else
    redirect_to "/products"
    end
  end

  def create
    if current_user.admn
    @product = Product.new(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price], supplier_id: params[:supplier_id])
    @product.save
    flash[:succes] = "Your contact has been created!"
    redirect_to "/products/#{@product.id}"
    else
    redirect_to "/products"
  end

  def edit
    if current_user.admn
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
    else
      redirect_to "/products"
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(name: params[:name], description: params[:description], intensity: params[:intensity], price: params[:price])
    @product.save
    flash[:info] = "Your contact has been updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    if current_user.admn?
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "Contact has been deleted"
    redirect_to "/products"
    else
    redirect_to "/products"
  end
end

  def one
    @first = Photo.first()
  end
  end
end
