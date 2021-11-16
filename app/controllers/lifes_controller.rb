class LifesController < ApplicationController
  def index
    @lifes = Life.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
