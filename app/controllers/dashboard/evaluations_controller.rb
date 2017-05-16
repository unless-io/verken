class Dashboard::EvaluationsController < ApplicationController
  before_action :set_item
  before_action :set_exploration
  before_action :set_evaluation, except: [:create]
  after_action :calculate_score, only: [:create, :update]
  
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.item = @item
    @evaluation.user = current_user
    if @evaluation.save
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully answered '#{@evaluation.criterium.title}'"
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] =  "Sorry! Something went wrong."
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully updated answer for '#{@evaluation.criterium.title}'"
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] =  "Sorry! Something went wrong."
    end
  end

  def destroy
    if @evaluation.destroy
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:notice] = "Succesfully removed answer for '#{@evaluation.criterium.title}'"
    else
      redirect_to dashboard_exploration_item_path(@exploration, @item)
      flash[:danger] =  "Sorry! Something went wrong."
    end
  end

  private

  def calculate_score
    sum = 0.0
    @item.evaluations.each do |evaluation|
      sum += evaluation.rating.to_i
    end
    @item.score = sum / @item.evaluations.length
    @item.save
  end

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_exploration
    @exploration = Exploration.find(params[:exploration_id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:criterium_id, :rating, :status)
  end
end