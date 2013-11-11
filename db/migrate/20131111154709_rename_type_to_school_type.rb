class RenameTypeToSchoolType < ActiveRecord::Migration
  def change
  	rename_column :organizers, :type, :school_type
  end
end
