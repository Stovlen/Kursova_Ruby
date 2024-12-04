class AddDeliveryToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :delivery_method, :string
    add_column :orders, :city, :string
    add_column :orders, :branch_number, :string
  end
end
