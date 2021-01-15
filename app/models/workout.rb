class Workout < ApplicationRecord
    has_many :trainings
    has_many :races, through: :trainings
    belongs_to :user

    validates :name, :distance, presence: true # 2021-01-15 01 added

    scope :order_by_popularity, -> { Workout.left_joins(:trainings).group(:id).order("count(trainings.workout_id) desc") } # 2021-01-15 02
    #order by how many training sessions
end
