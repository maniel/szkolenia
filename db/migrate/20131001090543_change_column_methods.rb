class ChangeColumnMethods < ActiveRecord::Migration
  def change
  	change_column :trainings, :methods, :text
  end
end
