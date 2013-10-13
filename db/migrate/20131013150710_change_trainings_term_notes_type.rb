class ChangeTrainingsTermNotesType < ActiveRecord::Migration
  def change
  	change_column :trainings, :term_notes, :text, :limit => nil
  end
end
