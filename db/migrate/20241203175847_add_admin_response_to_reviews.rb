class AddAdminResponseToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :admin_response, :text
  end
end
