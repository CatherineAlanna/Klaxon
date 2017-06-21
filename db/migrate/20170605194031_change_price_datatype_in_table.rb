class ChangePriceDatatypeInTable < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :price, :numeric
  end
end
