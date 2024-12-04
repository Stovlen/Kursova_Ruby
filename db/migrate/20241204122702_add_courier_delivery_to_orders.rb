class AddCourierDeliveryToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :street, :string
    add_column :orders, :building, :string
    add_column :orders, :apartment, :string
  end
end
