class AddTermNotesToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :term_notes, :string
  end
end
