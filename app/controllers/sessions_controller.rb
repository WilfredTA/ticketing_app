class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome to ticketing app"
      redirect_to root_url
    else
      flash[:error] = "There was a problem with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil;
    flash[:notice] = "You have been logged out"
    redirect_to root_url
  end

end
