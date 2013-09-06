class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.text :info
      t.binary :photo

      t.timestamps
    end
  end
end
