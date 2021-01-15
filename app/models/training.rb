class Training < ApplicationRecord
  belongs_to :race
  belongs_to :workout

  #accepts_nested_attributes_for :workout
    # :workout needs to match with the way the model association is named

  def workout_attributes=(workout_params)
    workout = Workout.find_or_create_by(workout_params)
    if workout.valid?
      self.workout = workout
    end
  end
end
