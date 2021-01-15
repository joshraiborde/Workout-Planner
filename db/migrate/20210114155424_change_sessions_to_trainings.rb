class ChangeSessionsToTrainings < ActiveRecord::Migration[6.1]
  def change
    rename_table :sessions, :trainings
  end
end