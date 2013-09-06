class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.text :address
      t.string :contact
      t.string :link

      t.timestamps
    end
  end
end
