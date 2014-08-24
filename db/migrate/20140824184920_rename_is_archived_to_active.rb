class RenameIsArchivedToActive < ActiveRecord::Migration
  def change
  	rename_column :zawod, :is_archived, :active
  	rename_column :trainings, :is_archived, :active
  end
end
