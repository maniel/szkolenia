class AddSchoolTypeToZawod < ActiveRecord::Migration
  def change
    add_column :zawod, :school_type, :text
  end
end
