class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :email
      t.string :delivery_option
      t.string :branch

      t.timestamps
    end
  end
end
