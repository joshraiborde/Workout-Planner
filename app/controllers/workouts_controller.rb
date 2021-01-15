class WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
    end
  
    def show
        @workout = Workout.find(params[:id])
    end
  
    def new
      @workout = Workout.new
    end
  
    def create
        @workout = current_user.created_workouts.build(workout_params)
        if @workout.save
         redirect_to workout_path(@workout)
         # it will redirect to the workout#show page
         # anytime it's going to forom url that needs a dynamic route or id, an instance needs to be used
        else
         render :new
        end
    end
    private

    def workout_params
     params.require(:workout).permit(:pace, :distance, :name, :category)
             # require the model
        # permit the attributes you want to allow in
        # strong params
    end
end
