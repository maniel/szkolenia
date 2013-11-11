class AddRequirementsAndTermAdditionalInfoToZawod < ActiveRecord::Migration
  def change
    add_column :zawod, :requirements, :text
    add_column :zawod, :term_additional_info, :text
  end
end
