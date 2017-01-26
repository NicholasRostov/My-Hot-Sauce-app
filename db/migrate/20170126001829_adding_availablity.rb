class AddingAvailablity < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :availability, :boolean, default: true
  end
end
