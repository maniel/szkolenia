class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :name
      t.text :address
      t.text :contact
      t.string :link
      t.boolean :college

      t.timestamps
    end
  end
end
