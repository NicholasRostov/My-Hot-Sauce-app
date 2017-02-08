class AddingAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admn, :boolean, default: false
  end
end
