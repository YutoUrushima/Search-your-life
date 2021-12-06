class LifesController < ApplicationController
  
  def login_form
  end
  
  def login
    @mail = params[:mail]
    @password = params[:password]
    @user = Life.find_by(mail: params[:mail])
    if @user &&  @user.password == @password
      flash[:notice] = "Success!"
      redirect_to "/"
    else
      flash[:alert] = "Error!"
      render "login_form"
    end
  end
  
  def check
    @email = params[:mail]
    @password = params[:password]
  end
  
  def index
    @lifes = Life.all
  end

  def show
    @life = Life.find(params[:id])
  end

  def new
    @life = Life.new
  end

  def edit
  end
end
