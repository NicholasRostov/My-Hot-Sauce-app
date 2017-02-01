class UsersController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Yayyy you created an account!"
      redirect_to "/"
    else
      flas[:warning] = "Try again numbnuts!"
      redirect_to "/signup"
    end
  end
end

