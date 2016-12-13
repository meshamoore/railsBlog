class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_foreign_key :comments, :users, on_delete: :cascade
    add_foreign_key :comments, :posts, on_delete: :cascade
  end
end
