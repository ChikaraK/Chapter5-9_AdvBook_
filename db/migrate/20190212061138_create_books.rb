class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :title
      t.text :book_cap
      t.text :book_caption
      t.integer :user_id

      t.timestamps
    end
  end
end
