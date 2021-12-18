class ContentsController < ApplicationController
  before_action :ensure_user
  before_action :set_user, only:[:edit, :update, :destroy]
  
  def create
    @content = Content.new
    if @content.update(content_params)
      redirect_to life_path(@life)
      flash[:notice] = "success!"
    else
      redirect_to life_path(@life)
      flash[:alert] = "Error!"
    end
  end
  
  def edit
  end
  
  def update
    if @content.update(content_params)
      redirect_to life_path(@life)
      flash[:notice] = "Success!"
    else
      render :edit
      flash[:alert] = "Error!"
    end
  end
  
  def destroy
    @content.destroy
    redirect_to life_path(@life)
    flash[:notice] = "Deleted!"
  end
  
  private
    def set_user
      @content = @life.contents.find(params[:id])
    end
    
    def ensure_user
      @life = Life.find(params[:life_id])
      if @life.id != @current_user
        flash[:alert] = 'ログインしてください'
        redirect_to login_path
      end
    end
    
    def content_params
      params.require(:content).permit(:year, :month, :date, :event, :life_id)
    end
end
