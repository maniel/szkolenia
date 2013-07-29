class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :program
      t.text :localization
      t.text :organizer

      t.timestamps
    end
  end
end
