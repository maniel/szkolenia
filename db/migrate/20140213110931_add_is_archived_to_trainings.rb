class AddIsArchivedToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :is_archived, :boolean
  end
end
