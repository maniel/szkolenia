class ChangeColumnMethodsLimit < ActiveRecord::Migration
  def change
  	change_column :trainings, :methods, :text, :limit => nil
  end
end
