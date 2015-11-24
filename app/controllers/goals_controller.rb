class GoalsController < ApplicationController
  before_action :redirect_non_user, only: [:new, :create]

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  private

  def redirect_non_user
    unless current_user
      redirect_to new_session_url
    end
  end

  def goal_params
    params.require(:goal).permit(:title, :body, :private_goal)
  end
end
