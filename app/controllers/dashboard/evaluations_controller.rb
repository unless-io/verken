class EvaluationsController < ApplicationController
  before_action :set_item
  before_action :set_exploration
  before_action :set_criterium
  
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.item = @item
    @evaluation.user = current_user
    if @evaluation.save
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully answered '#{@criterium.title}'"
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] =  "Sorry! Something went wrong."
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully updated answer for '#{@criterium.title}'"
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] =  "Sorry! Something went wrong."
    end
  end

  def destroy
    if @evaluation.destroy
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully removed answer for '#{@criterium.title}'"
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] =  "Sorry! Something went wrong."
    end
  end

  private

  def set_criterium
    @criterium = Criterium.find(params[:criterium_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_exploration
    @exploration = Exploration.find(params[:exploration_id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:criterium_id, :rating)
  end
end