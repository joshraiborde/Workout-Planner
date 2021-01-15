class TrainingsController < ApplicationController
  def show
    @training = Training.find(params[:id])
  end

  def index #2021-01-15 added index action
    #if it's nested
    if params[:workout_id] && workout = Workout.find_by_id(params[:workout_id])
      @trainings = workout.trainings

    #load up ony the trainings nested under that workout
    else
      #else keep with the same old stuff
      @trainings = Training.all
    end
  end
  

  def new
    #if it's nested
    if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
      @training = @workout.trainings.build #has_many

    #load up ony the trainings nested under that workout
    else
      #else keep with the same old stuff
      @training = Training.new
      @training.build_workout  #belongs_to - nested form
    end
  end

  def create #2021-01-15
    if params[:workout_id] && @workout = Workout.find_by_id(params[:workout_id])
     @training = @workout.trainings.build(training_params)
    else
     @training = Training.new(training_params)
    end
    if @training.save
     redirect_to training_path(@training)
    else
     render :new
    end
 end

  private

  def training_params
    params.require(:training).permit(:date,:feeling, :race_id, :workout_id, workout_attributes:[:name, :category, :pace, :distance, :user_id])
  end
          # require the model
        # permit the attributes you want to allow in
        # strong params
end
