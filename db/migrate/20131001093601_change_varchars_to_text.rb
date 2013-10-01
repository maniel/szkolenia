class ChangeVarcharsToText < ActiveRecord::Migration
  def change
	change_column :trainings, :target, :text, :limit => nil
	change_column :trainings, :groupsize, :text, :limit => nil	
  end
end
