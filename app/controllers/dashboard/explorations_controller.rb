class ExplorationsController < ApplicationController
  before_action :set_exploration, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    @exploration = Exploration.new(exploration_params)
    @exploration.creator = current_user
    if @exploration.save
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully started a new exploration"
    else
      render :new
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  def edit
  end

  def update
    if @exploration.update(exploration_params)
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully updated exploration"
    else
      render :edit
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  def destroy
    if @exploration.destroy
      redirect_to dashboard_path
      flash[:notice] = "Succesfully removed exploration"
    else
      redirect_to dashboard_exploration_path(@exploration)
      flash[:danger] =  "Sorry! Something went wrong."
    end
  end

  def results
  end

  def join
    @participant = Participant.new(user: current_user, exploration: @exploration)
    if @participant.save
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully joined exploration!"
    else
      redirect_to dashboard_exploration_path(@exploration)
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  def leave
    @participant = Participant.where(user: current_user, exploration: @exploration)
    if @participant.destroy
      redirect_to dashboard_exploration_path(@exploration)
      flash[:notice] = "Succesfully left exploration!"
    else
      redirect_to dashboard_exploration_path(@exploration)
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  private

  def set_exploration
    @exploration = Exploration.find(params[:id])
  end

  def exploration_params
    params.require(:exploration).permit(:title, :description)
  end
end