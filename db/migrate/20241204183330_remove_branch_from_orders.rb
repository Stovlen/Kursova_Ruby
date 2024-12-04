class RemoveBranchFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :branch, :string
  end
end
