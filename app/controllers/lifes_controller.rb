class LifesController < ApplicationController
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
