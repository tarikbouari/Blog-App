class ChangeForeignKeyForPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :author_id, :author_id
  end
end
