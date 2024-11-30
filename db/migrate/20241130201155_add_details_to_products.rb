class AddDetailsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :proteins, :decimal
    add_column :products, :fats, :decimal
    add_column :products, :carbs, :decimal
    add_column :products, :energy, :integer
    add_column :products, :country, :string
    add_column :products, :processing_type, :string
    add_column :products, :sugar_content, :string
  end
end
