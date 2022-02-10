class LifesController < ApplicationController
  before_action :the_time, only: [:show]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_life, only: [:edit, :update] 
  before_action :correct_life, only: [:edit, :update]
  
  def index
    @lifes = Life.all
  end

  def show
    # 誕生日のyyyymmdd
    @the_birthday = (@life.year.to_s + @life.month.to_s + @life.date.to_s).to_i
    # 現在の年齢
    @the_age = ((@fomatted_time.to_i - @the_birthday) / 10000).floor
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
      flash[:alert] = "creation error!"
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
      redirect_to @life
      flash[:notice] = "update!"
    else
      render :edit
      flash[:alert] = "update error!"
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
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_life
      @life = Life.find(params[:id])
      redirect_to(root_url) unless current_life?(@life)
    end
end
