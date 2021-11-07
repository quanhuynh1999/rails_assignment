class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :required_user, except: [:show, :index]
  def index
    @activities = Activity.paginate(page: params[:page], per_page: 10)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      flash[:notice] = "Create Activity successfully!"
      redirect_to activities_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      flash[:notice] = "Update Activity successfully!"
      redirect_to activity_path(@activity)
    else
      render 'edit'
    end
  end

  def destroy
    @activity.destroy
    flash[:notice] = "Delete Activity successfully!"
    redirect_to activities_path
  end

  private
    def activity_params
      params.require(:activity).permit(:message)
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end
end