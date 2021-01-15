class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.datetime :date
      t.string :feeling
      t.belongs_to :race, null: false, foreign_key: true
      t.belongs_to :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
