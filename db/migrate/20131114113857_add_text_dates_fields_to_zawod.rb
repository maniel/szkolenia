class AddTextDatesFieldsToZawod < ActiveRecord::Migration
  def change
    add_column :zawod, :begin_date_text, :text
    add_column :zawod, :end_date_text, :text
  end
end
