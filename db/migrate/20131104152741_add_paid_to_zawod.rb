class AddPaidToZawod < ActiveRecord::Migration
  def change
    add_column :zawod, :paid, :boolean
  end
end
