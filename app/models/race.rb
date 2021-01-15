class Race < ApplicationRecord
    belongs_to :user
    has_many :trainings
    has_many :workouts, through: :trainings

    validates :title, :distance, :category, presence: true # 2021-01-15 02
    validates :distance, numericality: { message: "%{value} must be a number" } # 2021-01-15 02

    validate :not_a_duplicate # 2021-01-15 02

    scope :order_alpha_reverse, -> { order(title: :desc)} # 2021-01-15 02
    scope :longest_two_races, -> { order(distance: :desc).limit(2)} # 2021-01-15 02
    scope :distance_search, -> (search_distance){ where("distance > ?", search_distance)} # 2021-01-15 02


    def not_a_duplicate # 2021-01-15 02
        #instance method
        if Race.find_by(title: title, distance: distance, category: category) #all of the thing we dont want duplicated
          errors.add("race", "has already been used - this race has already been created")
        end
      end
end
