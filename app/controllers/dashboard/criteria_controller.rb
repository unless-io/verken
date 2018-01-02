class Dashboard::CriteriaController < ApplicationController
  before_action :set_criterium, only: [:edit]
  before_action :set_exploration, except: [:edit]

  def create
    @criterium = Criterium.new(criterium_params)
    @criterium.exploration = @exploration
    @criterium.question_type = "1-10"
    if @criterium.save
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully added a new criterium."
      @exploration.items.each do |item|
        item.evaluations << Evaluation.create(user: current_user, criterium: @criterium, rating: "")
      end
    else
      redirect_to dashboard_exploration_path(@exploration)
      flash[:danger] = "Sorry! Something went wrong"
    end
  end

  def edit
  end

  def update
    if @criterium.update(criterium_params)
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully updated criterium."
    else
      redirect_to dashboard_exploration_path(@exploration)
      flash[:danger] = "Sorry! Something went wrong"
    end
  end

  def destroy
    if @criterium.destroy
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully removed criterium."
    else
      redirect_to dashboard_exploration_path(@exploration)
      flash[:danger] = "Sorry! Something went wrong"
    end
  end

  private

  def set_criterium
    @criterium = Criterium.find(params[:id])
  end

  def set_exploration
    @exploration = Exploration.find(params[:exploration_id])
  end

  def criterium_params
    params.require(:criterium).permit(:title, :question_type)
  end
end