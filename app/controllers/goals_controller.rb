class GoalsController < ApplicationController
  before_action :redirect_non_user, only: [:new, :create]

  def index
  end

  def new

    @goal = Goal.new
  end

  private

  def redirect_non_user
    unless current_user
      redirect_to new_session_url
    end
  end
end
