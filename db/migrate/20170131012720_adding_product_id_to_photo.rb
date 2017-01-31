class AddingProductIdToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :product_id, :string
  end
end
