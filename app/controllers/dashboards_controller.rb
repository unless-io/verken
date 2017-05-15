class DashboardsController < ApplicationController
  def show
    @exploration = Exploration.new
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to dashboard_path
      flash[:notice] = "Succesfully updated your information"
    else
      render :edit
      flash[:danger] = "Sorry! Something went wrong."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end