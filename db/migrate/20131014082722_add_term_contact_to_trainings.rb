class AddTermContactToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :term_contact, :text, :limit => nil
  end
end
