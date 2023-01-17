class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_references :posts, :author, foreign_key: true
  end
end
