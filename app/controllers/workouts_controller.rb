class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show] #2021-01-16 02
    
    def index
        # @workouts = Workout.all # 2021-01-15 02
        @workouts = Workout.order_by_popularity # 2021-01-15 02
    end
  
    def show #2021-01-16 02 
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

    def set_workout # finding an instance # 2021-01-16 02
        @workout = Workout.find_by(id: params[:id])
        redirect_to workouts_path if !@workout #redirect to all of the workouts if a specifc workout was not found from the params :id
     end
end
