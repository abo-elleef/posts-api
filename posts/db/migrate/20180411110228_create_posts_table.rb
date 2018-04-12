class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :type
      t.text :text
      t.integer :user_id
      t.timestamps null:false
    end

    add_index :posts , :user_id
  end
end
