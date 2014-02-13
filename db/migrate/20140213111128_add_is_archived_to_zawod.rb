class AddIsArchivedToZawod < ActiveRecord::Migration
  def change
    add_column :zawod, :is_archived, :boolean
  end
end
