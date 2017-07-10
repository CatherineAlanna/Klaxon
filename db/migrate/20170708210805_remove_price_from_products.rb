class RemovePriceFromProducts < ActiveRecord::Migration[5.1]
  def down
    remove_column :products, :price, :decimal
  end
end
