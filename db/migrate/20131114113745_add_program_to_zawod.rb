class AddProgramToZawod < ActiveRecord::Migration
  def change
    add_column :zawod, :program, :text
  end
end
