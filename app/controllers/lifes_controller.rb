class LifesController < ApplicationController
  
  def login_form
  end
  
  def login
    @mail = params[:mail]
    @password = params[:password]
    @user = Life.find_by(mail: params[:mail])
    if @user &&  @user.password == @password
      session[:current_user] = @user.id
      flash[:notice] = "Success!"
      redirect_to root_path
    else
      flash[:alert] = "Error!"
      render :login_form
    end
  end
  
  def logout
    session[:current_user] = nil
    flash[:notice] = "logout!"
    redirect_to root_path
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
  
  def create
    @life = Life.new(life_params)
    if @life.save
      session[:current_user] = @life.id
      flash[:notice] = "created!"
      redirect_to root_path
    else
      flash[:alert] = "creation error!"
      render :new
    end
  end

  def edit
  end
  
  private
    def life_params
      params.require(:life).permit(:mail, :password)
    end
  
end
