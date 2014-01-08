class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :text, :limit => nil
  end
end
