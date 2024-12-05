class RemoveUnusedColumnsFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :delivery_option, :string
    remove_column :orders, :street, :string
    remove_column :orders, :building, :string
    remove_column :orders, :apartment, :string
  end
end
