class SessionsController < ApplicationController

  def new
  end
  
  def create
    life = Life.find_by(email: params[:session][:email].downcase)
    if life && life.authenticate(params[:session][:password])
      log_in life
      flash[:notice] = "Success!"
      redirect_to life
    else
      flash.now[:alert] = "Error!"
      render :new
    end
  end
  
  def destroy
    session[:current_user] = nil
    flash[:notice] = "logout!"
    redirect_to root_path
  end
end
