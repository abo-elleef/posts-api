class RenamePostsTypeToNature < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :type, :nature
  end
end
