class ChangeActiveDefault < ActiveRecord::Migration
  def change
  	change_column :trainings, :active, :boolean, default: true
  	change_column :zawod, :active, :boolean, default: true
  end
end
