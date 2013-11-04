class CreateZawod < ActiveRecord::Migration
  def change
    create_table :zawod do |t|
      t.string :name
      t.text :description
      t.text :additional_info
      t.text :address
      t.text :costs_semester
      t.text :costs_info
      t.date :begin_date
      t.date :end_date
      t.text :term_time
      t.text :term_info
      t.text :documents
      t.references :organizer, index: true
      t.references :location, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
