class CreateTrainings < ActiveRecord::Migration[7.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.boolean :single
      t.integer :reps
      t.integer :durantion_minutes

      t.timestamps
    end
  end
end
