class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :comment
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
