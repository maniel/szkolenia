class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :info
      t.text :moreinfo #uwagi
      t.string :target #szolenia: cel szolenia
      t.string :methods #szolenia: metody
      t.string :groupsize #szolenia: wielkość grupy
      t.boolean :studies
      t.boolean :postgrad
      t.boolean :elearning
      t.boolean :paid
      t.string :costs
      t.text :costs_info
      t.text :trainer_info
      t.string :term
      t.text :term_info
      t.date :begin_date
      t.date :end_date
      t.text :address
      t.references :organizer, index: true
      t.references :location, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
