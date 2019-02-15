class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_image_id, :text
    add_column :users, :user_caption, :text
  end
end
