class ActivitiesController < ApplicationController
  def index
    @activity = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:notice] = "Create Activity successfully!"
      redirect_to activity_path(@activity)
    else
      render 'new'
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      flash[:notice] = "Update Activity successfully!"
      redirect_to activity_path(@activity)
    else
      render 'edit'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    flash[:notice] = "Delete Activity successfully!"
    redirect_to activities_path
  end

  private
    def activity_params
      params.require(:activity).permit(:message)
    end
end