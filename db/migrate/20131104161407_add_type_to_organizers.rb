class AddTypeToOrganizers < ActiveRecord::Migration
  def change
    add_column :organizers, :type, :text
  end
end
