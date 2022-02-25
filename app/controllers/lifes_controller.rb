class LifesController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :logged_in_life, only: [:edit, :update] 
  before_action :correct_life_logged_in, only: [:edit, :update]
  
  def index
    @lifes = Life.paginate(page: params[:page])
  end

  def show
    @the_age = get_life_age(@life)
  end

  def new
    @life = Life.new
  end
  
  def create
    life = Life.new(user_params)
    if life.save
      log_in life
      UserMailer.with(life: life).welcome_email.deliver_later
      flash[:notice] = "created!"
      redirect_to root_path
    else
      flash.now[:alert] = "creation error!"
      render :new
    end
  end

  def edit
  end
  
  def update
    if params[:life][:image]
      @life.image = "#{@life.id}.jpg"
      image = params[:life][:image]
      File.binwrite("public/user_images/#{@life.image}", image.read)
    end
    if @life.update(life_params)
      flash[:notice] = "update!"
      redirect_to @life
    else
      flash.now[:alert] = "update error!"
      render :edit
    end
  end
  
  private
    def set_user
      @life = Life.find(params[:id])
    end
    
    def user_params
      params.require(:life).permit(:name, :email, :password, :password_confirmation)
    end
    
    def life_params
      params.require(:life).permit(:name, :year, :month, :date, :introduce, :image)
    end
    
    # 何らかのユーザーがログインしているか確認
    def logged_in_life
      unless logged_in?
        store_location # フレンドリーフォワーディングへ向けてURLを記憶
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_life_logged_in
      @life = Life.find(params[:id])
      redirect_to(root_url) unless current_life?(@life)
    end
end
