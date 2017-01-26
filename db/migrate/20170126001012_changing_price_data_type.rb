class ChangingPriceDataType < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 8, scale: 2
  end
end
