class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_exploration, only: [:create, :update, :destroy]

  def show
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @item.exploration = @exploration
    if @item.save
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully created a new item."
    else
      render :new
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully updated item."
    else
      render :edit
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  def destroy
    if @item.destroy
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully removed item."
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  private

  def set_exploration
    @exploration = Exploration.find(params[:exploration_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :photo_url)
  end
end