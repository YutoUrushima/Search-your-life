class LifesController < ApplicationController
  
  def login_form
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
