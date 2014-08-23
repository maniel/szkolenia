class AddIsArchivedToZawod < ActiveRecord::Migration
  def change
    add_column :zawod, :is_archived, :boolean, default: false
  end
end
