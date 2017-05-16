class Dashboard::LinksController < ApplicationController
  before_action :set_exploration
  before_action :set_item
  before_action :set_link

  def create
    @link = Link.new(link_params)
    @link.item = @item
    if @link.save
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully added link."
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  def update
    if @link.update(link_params)
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully updated link."
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  def destroy
    if @link.destroy
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully removed link."
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
    @item = Item.find(params[:item_id])
  end

  def set_link
    @link = Link.find(params[:link_id])
  end

  def link_params
    params.require(:link).permit(:url)
  end
end