class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :title
      t.string :category
      t.integer :distance
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
