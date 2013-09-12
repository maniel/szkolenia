class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.text :info

      t.timestamps
    end

    create_table :trainers_trainings do |t|
		t.belongs_to :trainer
		t.belongs_to :training
    end
  end
end
