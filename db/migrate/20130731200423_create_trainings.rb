class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :info
      t.text :moreinfo
      t.boolean :studies
      t.boolean :postgrad
      t.boolean :elearning
      t.boolean :paid
      t.text :costs
      t.text :term
      t.text :address
      t.string :organizer
      t.references :location, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
