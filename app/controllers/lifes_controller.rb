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
    @content = Content.new
  end

  def new
    @life = Life.new
  end
  
  def create
    @life = Life.new(user_params)
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
    @life = Life.find(params[:id])
  end
  
  def update
    @life = Life.find(params[:id])
    if params[:life][:image]
      @life.image = "#{@life.id}.jpg"
      image = params[:life][:image]
      File.binwrite("public/user_images/#{@life.image}", image.read)
    end
    if @life.update(life_params)
      redirect_to life_path
      flash[:notice] = "update!"
    else
      render :show
      flash[:alert] = "update error!"
    end
  end
  
  private
    def user_params
      params.require(:life).permit(:mail, :password)
    end
    
    def life_params
      params.require(:life).permit(:name, :year, :month, :date, :introduce, :image)
    end
  
end
