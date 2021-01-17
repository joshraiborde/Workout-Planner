class Training < ApplicationRecord
  belongs_to :race
  belongs_to :workout

  scope :by_workout, -> (workout_id) {where("workout_id = ?", workout_id)} #2021-01-15 01

  validates :date, presence: true #2021-01-15 01
  validates_associated :workout #2021-01-15 02 training wont save unless workout is valid
  #accepts_nested_attributes_for :workout
    # :workout needs to match with the way the model association is named

  def workout_attributes=(workout_params)
    workout = Workout.find_or_create_by(workout_params)
    workout_params[:name].empty? ? self.workout : self.workout = workout #2021-01-15 02
    # workout.valid? ? self.workout = workout : self.workout
    # 2021-01-15 01 added above line, removed workout/valid lines
    # if workout.valid?
    #   self.workout = workout
    # end
  end
  
  def datetime #2021-01-16 02 moved here for easy access to modify
    self.date.strftime("%A, %b %d") if self.date
    #self.date.try(:strftime, "%A, %b %d") this does the same as thing as the line above
  end

  def username #2021-01-17
    @username ||= self.race.try(:user).try(:username) # 2021-01-17 moved here from app/views/trainings/index.html.erb
  end

end

# 2021-01-16 02 code that involves your database should go in your model
# 2021-01-16 02 anything to do with "sorting" or "ordering" goes in a scope method in the model