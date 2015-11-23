class GoalsController < ApplicationController
  before_action :redirect_non_user, only: [:new, :create]

  def index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  private

  def redirect_non_user
    unless current_user
      redirect_to new_session_url
    end
  end

  def goal_params
    params.permit(:goal).require(:title, :body, :private_goal, :completed)
  end
end
