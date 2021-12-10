class ContentsController < ApplicationController
  
  def create
    @life = Life.find(params[:life_id])
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
    @life = Life.find(params[:life_id])
    @content = @life.contents.find(params[:id])
  end
  
  def update
    @life = Life.find(params[:life_id])
    @content = @life.contents.find(params[:id])
    if @content.update(content_params)
      redirect_to life_path(@life)
      flash[:notice] = "Success!"
    else
      render :edit
      flash[:alert] = "Error!"
    end
  end
  
  def destroy
    @life = Life.find(params[:life_id])
    @content = @life.contents.find(params[:id])
    @content.destroy
    redirect_to life_path(@life)
    flash[:notice] = "Deleted!"
  end
  
  private
    def content_params
      params.require(:content).permit(:year, :month, :date, :event, :life_id)
    end
end
