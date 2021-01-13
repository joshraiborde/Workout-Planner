class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :category
      t.string :pace
      t.integer :distance
      t.string :name

      t.timestamps
    end
  end
end
